import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/summarize/bloc/state/summary_state.dart';
import 'package:smart_money/features/summarize/bloc/summary_bloc.dart';
import 'package:smart_money/features/summarize/widgets/summary_list_widget.dart';
import 'package:smart_money/features/summarize/widgets/summary_switch_widget.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/widgets/base_app_bar.dart';
import 'package:smart_money/widgets/base_date_picker.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends BaseState<SummaryScreen> {
  final TextEditingController _dateTime = TextEditingController();
  bool isYear = false;
  DateTime dateTime = DateTime.now();
  bool isShowAll = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final initialDateTime = BaseDateFormatter.formatDateTimeWithNameOfMonth(
        DateTime.now(),
        'yyyy-MM-dd',
      );

      _dateTime.text = initialDateTime;
      context.read<SummaryBloc>().readSummaryList(isYear);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return BaseScaffold(
      isLoadingStream: context.watch<SummaryBloc>().isLoading,
      appBar: BaseAppBar(
        title: Text(
          'สรุป',
          style: AppStyle.txtHeader2,
        ),
        bgColor: AppColor.whiteColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) async {
              if (value == '1') {
                setState(() {
                  isShowAll = !isShowAll;
                });
                context
                    .read<SummaryBloc>()
                    .readSummaryList(isYear, dateTime, isShowAll);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: '1',
                child: Text(
                  isShowAll ? 'แสดงเฉพาะข้อมูลคัดกรอง' : 'แสดงยอดทั้งหมด',
                  style: AppStyle.txtBody2,
                ),
              ),
            ],
          ),
        ],
      ),
      bodyBuilder: (context, constraint) {
        return CustomScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<SummaryBloc, SummaryState>(
                      builder: (context, state) {
                        final monthList = state.monthList;
                        final dayList = state.dayList;

                        if (dayList == null || monthList == null) {
                          return const SizedBox.shrink();
                        }

                        return SfCartesianChart(
                          // Initialize category axis
                          primaryXAxis: CategoryAxis(
                            autoScrollingMode: AutoScrollingMode.end,
                          ),
                          series: <LineSeries<Map<String, double>, String>>[
                            LineSeries<Map<String, double>, String>(
                              dataSource: isYear ? monthList : dayList,
                              xValueMapper: (Map<String, double> data, _) =>
                                  data.entries.first.key,
                              yValueMapper: (Map<String, double> data, _) =>
                                  data.entries.first.value,
                            ),
                          ],
                          zoomPanBehavior: ZoomPanBehavior(
                            enablePanning: true,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: BaseTextField(
                            label: 'วันที่',
                            controller: _dateTime,
                            isReadOnly: true,
                            isEnabled: true,
                            isShowLabelField: true,
                            textInputType: TextInputType.number,
                            onTap: () {
                              BaseDatePicker.show(
                                context: context,
                                onSubmit: (submitDate) {
                                  final _dateTimeConvert = BaseDateFormatter
                                      .formatDateTimeWithNameOfMonth(
                                    submitDate![0],
                                    'yyyy-MM-dd',
                                  );
                                  setState(() {
                                    _dateTime.text = _dateTimeConvert;
                                    dateTime = submitDate[0];
                                  });

                                  context
                                      .read<SummaryBloc>()
                                      .readSummaryList(isYear, submitDate[0]);
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: SummarySwitchWidget(
                            onChanged: (val) {
                              setState(() {
                                isYear = val;
                                context
                                    .read<SummaryBloc>()
                                    .readSummaryList(isYear, dateTime);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  24,
                  8,
                  24,
                  bottom,
                ),
                child: const SummaryListWidget(),
              ),
            ),
          ],
        );
      },
    );
  }
}

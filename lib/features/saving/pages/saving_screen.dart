import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/saving/bloc/saving_bloc.dart';
import 'package:smart_money/features/saving/bloc/state/saving_state.dart';
import 'package:smart_money/features/saving/enum/field_saving_enum.dart';
import 'package:smart_money/features/saving/widgets/saving_list_widget.dart';
import 'package:smart_money/features/saving/widgets/saving_switch_widget.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/utils/validate/vaildators.dart';
import 'package:smart_money/widgets/base_app_bar.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/widgets/base_date_picker.dart';
import 'package:smart_money/widgets/base_form.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';

class SavingScreen extends StatefulWidget {
  const SavingScreen({super.key});

  @override
  _SavingScreenState createState() => _SavingScreenState();
}

class _SavingScreenState extends BaseState<SavingScreen> {
  final _formKey = GlobalKey<BaseFormState>();
  final TextEditingController _dateTime = TextEditingController();
  final TextEditingController _saving = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  bool isIncrease = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SavingBloc>().readSavingList();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dateTime.dispose();
    _saving.dispose();
    _detail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return BaseScaffold(
      isLoadingStream: context.watch<SavingBloc>().isLoading,
      appBar: BaseAppBar(
        title: Text(
          'การออม',
          style: AppStyle.txtHeader2,
        ),
        bgColor: AppColor.whiteColor,
      ),
      bodyBuilder: (context, constraint) {
        return BaseForm(
          key: _formKey,
          onChanged: context.read<SavingBloc>().onChanged,
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseTextField(
                        fieldKey: FieldSaving.savingDateTime,
                        label: 'วันที่บันทึก',
                        controller: _dateTime,
                        isReadOnly: true,
                        isEnabled: true,
                        isShowLabelField: true,
                        textInputType: TextInputType.number,
                        validator: Validators.combine(
                          [
                            Validators.withMessage(
                              "Required",
                              Validators.isEmpty,
                            ),
                          ],
                        ),
                        onTap: () {
                          BaseDatePicker.show(
                            context: context,
                            onSubmit: (submitDate) {
                              setState(() {
                                _dateTime.text = BaseDateFormatter
                                    .formatDateTimeWithNameOfMonth(
                                  submitDate![0],
                                  'yyyy-MM-dd',
                                );
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BaseTextField(
                        fieldKey: FieldSaving.saving,
                        label: 'เพิ่มเงินออม',
                        isShowLabelField: true,
                        controller: _saving,
                        textInputType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          // Allow Decimal Number With Precision of 2 Only
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}'),
                          ),
                        ],
                        validator: Validators.combine(
                          [
                            Validators.withMessage(
                              "Required",
                              Validators.isEmpty,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BaseTextField(
                        fieldKey: FieldSaving.detail,
                        label: 'รายละเอียด',
                        isShowLabelField: true,
                        controller: _detail,
                        validator: Validators.combine(
                          [
                            Validators.withMessage(
                              "Required",
                              Validators.isEmpty,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SavingSwitchWidget(
                        onChanged: (val) {
                          setState(() {
                            isIncrease = val;
                          });
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BaseButton(
                        onTap: () async {
                          if (_saving.text.isEmpty ||
                              _dateTime.text.isEmpty ||
                              _detail.text.isEmpty) {
                            await _showMyDialog();
                            return;
                          }
                          context.read<SavingBloc>().createSaving(!isIncrease);
                          _clearForm();
                        },
                        text: 'บันทึก',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BlocBuilder<SavingBloc, SavingState>(
                        builder: (context, list) {
                          final savingMoney = list.myAccount;

                          return Text(
                            'เงินออม: ${savingMoney?.savingMoney ?? 0}',
                            style: AppStyle.txtHeader3,
                          );
                        },
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
                  child: const SavingListWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _clearForm() {
    _dateTime.clear();
    _detail.clear();
    _saving.clear();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Warning',
            style: AppStyle.txtHeader2,
          ),
          content: Text(
            'กรุณากรอกข้อมูลให้ครบ',
            style: AppStyle.txtHeader3,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: AppStyle.txtBody2,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

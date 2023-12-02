import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/features/summarize/bloc/state/summary_state.dart';
import 'package:smart_money/features/summarize/bloc/summary_bloc.dart';
import 'package:smart_money/features/summarize/widgets/summary_card_widget.dart';

class SummaryListWidget extends StatelessWidget {
  const SummaryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryBloc, SummaryState>(
      builder: (context, list) {
        final summaryList = list.myAccount?.myAccountDetail;

        if (summaryList == null) {
          return const CircularProgressIndicator();
        }

        return ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: summaryList.length,
          itemBuilder: (context, index) {
            final item = summaryList[index];

            return SummaryCardWidget(
              summaryItem: item,
            );
          },
          separatorBuilder: (_, __) => SizedBox(
            height: 16.h,
          ),
        );
      },
    );
  }
}

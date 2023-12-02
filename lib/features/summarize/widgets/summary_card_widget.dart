import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

class SummaryCardWidget extends StatelessWidget {
  final MyAccountDetailResponse summaryItem;

  const SummaryCardWidget({super.key, required this.summaryItem});

  @override
  Widget build(BuildContext context) {
    final money = summaryItem.money;
    final detail = summaryItem.detail;
    final date = summaryItem.dateTime;
    final isIncome = summaryItem.type == TypeIncomeExpenses.income;

    return Container(
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ).r,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${isIncome ? '' : '-'} $money',
            style: AppStyle.txtBody2,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            '$detail',
            style: AppStyle.txtCaption,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            '$date',
            style: AppStyle.txtCaption,
          ),
        ],
      ),
    );
  }
}

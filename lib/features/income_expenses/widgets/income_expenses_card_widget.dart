import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

class IncomeExpensesCardWidget extends StatelessWidget {
  final MyAccountDetailResponse incomeExpensesItem;

  const IncomeExpensesCardWidget({super.key, required this.incomeExpensesItem});

  @override
  Widget build(BuildContext context) {
    final money = incomeExpensesItem.money;
    final detail = incomeExpensesItem.detail;
    final date = incomeExpensesItem.dateTime;
    final isIncome = incomeExpensesItem.type == TypeIncomeExpenses.income;

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
          Row(
            children: [
              Expanded(
                child: Text(
                  '${isIncome ? '' : '-'} $money',
                  style: AppStyle.txtBody2,
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (String value) async {
                  if (value == 'delete') {
                    context.read<IncomeExpensesBloc>().deleteIncomeExpenses(
                          '${incomeExpensesItem.id}',
                          isIncome,
                        );
                  } else if (value == 'edit') {
                    final result = await context.pushNamed<bool>(
                      editIncomeExpenses,
                      extra: incomeExpensesItem,
                    );

                    if (result!) {
                      await context
                          .read<IncomeExpensesBloc>()
                          .readIncomeExpensesList();
                    }
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Text(
                      'แก้ไข้',
                      style: AppStyle.txtCaption,
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text(
                      'ลบ',
                      style: AppStyle.txtCaption,
                    ),
                  ),
                ],
              ),
            ],
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

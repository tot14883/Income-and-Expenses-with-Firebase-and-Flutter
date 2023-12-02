import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/features/saving/bloc/saving_bloc.dart';

class SavingCardWidget extends StatelessWidget {
  final MyAccountDetailResponse savingItem;

  const SavingCardWidget({super.key, required this.savingItem});

  @override
  Widget build(BuildContext context) {
    final money = savingItem.money;
    final detail = savingItem.detail;
    final date = savingItem.dateTime;
    final isIncrease = savingItem.type == TypeIncomeExpenses.income;

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
                  '${isIncrease ? '' : '-'} $money',
                  style: AppStyle.txtBody2,
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (String value) async {
                  if (value == 'delete') {
                    context.read<SavingBloc>().deleteSaving('${savingItem.id}');
                  } else if (value == 'edit') {
                    final result = await context.pushNamed<bool>(
                      editSaving,
                      extra: savingItem,
                    );

                    if (result!) {
                      await context.read<SavingBloc>().readSavingList();
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart';
import 'package:smart_money/features/income_expenses/bloc/state/income_expenses_state.dart';
import 'package:smart_money/features/income_expenses/widgets/income_expenses_card_widget.dart';

class IncomeExpensesListWidget extends StatelessWidget {
  const IncomeExpensesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeExpensesBloc, IncomeExpensesState>(
      builder: (context, list) {
        final incomeExpensesList = list.myAccount?.myAccountDetail;

        if (incomeExpensesList == null) {
          return const CircularProgressIndicator();
        }

        return ListView.separated(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: incomeExpensesList.length,
          itemBuilder: (context, index) {
            final item = incomeExpensesList[index];

            return IncomeExpensesCardWidget(
              incomeExpensesItem: item,
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

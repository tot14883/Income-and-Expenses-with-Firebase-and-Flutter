import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart';
import 'package:smart_money/features/income_expenses/bloc/state/income_expenses_state.dart';
import 'package:smart_money/features/income_expenses/enum/field_income_expenses_enum.dart';
import 'package:smart_money/utils/validate/vaildators.dart';
import 'package:smart_money/widgets/base_app_bar.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/widgets/base_form.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';

class AddCashScreen extends StatefulWidget {
  const AddCashScreen({super.key});

  @override
  _AddCashScreenState createState() => _AddCashScreenState();
}

class _AddCashScreenState extends BaseState<AddCashScreen> {
  final _formKey = GlobalKey<BaseFormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<IncomeExpensesBloc>().readIncomeExpensesList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: Text(
          'เพิ่มเงินในบัญชี',
          style: AppStyle.txtHeader2,
        ),
        bgColor: AppColor.whiteColor,
      ),
      bodyBuilder: (context, constraint) {
        return Padding(
          padding: const EdgeInsets.all(24).r,
          child: BaseForm(
            key: _formKey,
            onChanged: context.read<IncomeExpensesBloc>().onChanged,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseTextField(
                  fieldKey: FieldIncomeExpenses.cash,
                  label: 'เพิ่มเงินในบัญชี',
                  isShowLabelField: true,
                  textInputType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
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
                BaseButton(
                  onTap: () async {
                    final result =
                        await context.read<IncomeExpensesBloc>().addCashMoney();

                    if (result) {
                      context.pop(true);
                    }
                  },
                  text: 'บันทึก',
                ),
                SizedBox(
                  height: 16.h,
                ),
                BlocBuilder<IncomeExpensesBloc, IncomeExpensesState>(
                  builder: (context, state) {
                    final incomeExpensesMoney =
                        state.myAccount?.incomeExpenseMoney;

                    return Text(
                      'เงินในบัญชี: ${incomeExpensesMoney ?? 0}',
                      style: AppStyle.txtHeader3,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

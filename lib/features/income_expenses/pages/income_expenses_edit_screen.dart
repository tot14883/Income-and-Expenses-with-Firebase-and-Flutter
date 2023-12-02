import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart';
import 'package:smart_money/features/income_expenses/enum/field_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/utils/validate/vaildators.dart';
import 'package:smart_money/widgets/base_app_bar.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/widgets/base_date_picker.dart';
import 'package:smart_money/widgets/base_form.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';

class IncomeExpensesEditScreen extends StatefulWidget {
  final MyAccountDetailResponse myAccountDetail;
  final bool isIncome;

  const IncomeExpensesEditScreen({
    super.key,
    required this.myAccountDetail,
    this.isIncome = true,
  });

  @override
  _IncomeExpensesEditScreenState createState() =>
      _IncomeExpensesEditScreenState();
}

class _IncomeExpensesEditScreenState
    extends BaseState<IncomeExpensesEditScreen> {
  final _formKey = GlobalKey<BaseFormState>();
  final TextEditingController _money = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  final TextEditingController _dateTime = TextEditingController();
  bool isIncome = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final myAccountDetail = widget.myAccountDetail;
      _money.text = '${myAccountDetail.money}';
      _detail.text = '${myAccountDetail.detail}';
      _dateTime.text = '${myAccountDetail.dateTime}';

      isIncome = widget.isIncome;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isLoadingStream: context.watch<IncomeExpensesBloc>().isLoading,
      appBar: BaseAppBar(
        title: Text(
          isIncome ? 'แก้ไขรายรับ' : 'แก้ไขรายจ่าย',
          style: AppStyle.txtHeader2,
        ),
        bgColor: AppColor.whiteColor,
      ),
      bodyBuilder: (context, constraint) {
        return BaseForm(
          key: _formKey,
          onChanged: context.read<IncomeExpensesBloc>().onChanged,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseTextField(
                  fieldKey: FieldIncomeExpenses.dateTime,
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
                          _dateTime.text =
                              BaseDateFormatter.formatDateTimeWithNameOfMonth(
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
                  fieldKey: FieldIncomeExpenses.cash,
                  label: 'แก้ไขเงิน',
                  controller: _money,
                  isShowLabelField: true,
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
                  fieldKey: FieldIncomeExpenses.detail,
                  label: 'แก้ไขรายละเอียด',
                  controller: _detail,
                  isShowLabelField: true,
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
                // SavingSwitchWidget(
                //   initialValue:
                //       widget.myAccountDetail.type == TypeIncomeExpenses.income
                //           ? false
                //           : true,
                //   onChanged: (val) {
                //     setState(() {
                //       isIncrease = val;
                //     });
                //   },
                // ),
                // SizedBox(
                //   height: 8.h,
                // ),
                BaseButton(
                  onTap: () {
                    _formKey.currentState?.save(
                      onSave: (value) async {
                        final result = await context
                            .read<IncomeExpensesBloc>()
                            .editIncomeExpenses(
                              '${widget.myAccountDetail.id}',
                              isIncome,
                              '${widget.myAccountDetail.money}',
                              widget.myAccountDetail.type ??
                                  TypeIncomeExpenses.income,
                            );
                        if (result) {
                          context.pop(true);
                        }
                      },
                    );
                  },
                  text: 'บันทึก',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

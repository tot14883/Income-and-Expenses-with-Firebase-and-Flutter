import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/core/style/app_color.dart';
import 'package:smart_money/core/style/app_style.dart';
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart';
import 'package:smart_money/features/income_expenses/bloc/state/income_expenses_state.dart';
import 'package:smart_money/features/income_expenses/enum/field_income_expenses_enum.dart';
import 'package:smart_money/features/income_expenses/widgets/income_expenses_list_widget.dart';
import 'package:smart_money/features/income_expenses/widgets/income_expenses_switch_widget.dart';
import 'package:smart_money/utils/util/date_format.dart';
import 'package:smart_money/utils/validate/vaildators.dart';
import 'package:smart_money/widgets/base_app_bar.dart';
import 'package:smart_money/widgets/base_button.dart';
import 'package:smart_money/widgets/base_date_picker.dart';
import 'package:smart_money/widgets/base_form.dart';
import 'package:smart_money/widgets/base_scaffold.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/base_text_field.dart';

class IncomeExpensesScreen extends StatefulWidget {
  const IncomeExpensesScreen({super.key});

  @override
  _IncomeExpensesScreenState createState() => _IncomeExpensesScreenState();
}

class _IncomeExpensesScreenState extends BaseState<IncomeExpensesScreen> {
  final _formKey = GlobalKey<BaseFormState>();
  final TextEditingController _dateTime = TextEditingController();
  final TextEditingController _cash = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  bool isIncome = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<IncomeExpensesBloc>().readIncomeExpensesList();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dateTime.dispose();
    _cash.dispose();
    _detail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return BaseScaffold(
      isLoadingStream: context.watch<IncomeExpensesBloc>().isLoading,
      appBar: BaseAppBar(
        title: Text(
          'รายรับ-รายจ่าย',
          style: AppStyle.txtHeader2,
        ),
        bgColor: AppColor.whiteColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) async {
              if (value == '1') {
                final result = await context.pushNamed<bool>(addCash);

                if (result!) {
                  await context
                      .read<IncomeExpensesBloc>()
                      .readIncomeExpensesList();
                }
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: '1',
                child: Text(
                  'เพิ่มเงินในบัญชี',
                  style: AppStyle.txtBody2,
                ),
              ),
            ],
          ),
        ],
      ),
      bodyBuilder: (context, constraint) {
        return BaseForm(
          key: _formKey,
          onChanged: context.read<IncomeExpensesBloc>().onChanged,
          child: CustomScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: Column(
                    children: [
                      Column(
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
                                  setState(
                                    () {
                                      _dateTime.text = BaseDateFormatter
                                          .formatDateTimeWithNameOfMonth(
                                        submitDate![0],
                                        'yyyy-MM-dd',
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          BaseTextField(
                            fieldKey: FieldIncomeExpenses.cash,
                            label: 'จำนวนเงิน',
                            controller: _cash,
                            textInputType:
                                const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            isShowLabelField: true,
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
                            label: 'รายละเอียด',
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
                          IncomeExpensesSwitchWidget(
                            onChanged: (val) {
                              setState(() {
                                isIncome = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          BaseButton(
                            onTap: () async {
                              if (_cash.text.isEmpty ||
                                  _dateTime.text.isEmpty ||
                                  _detail.text.isEmpty) {
                                await _showMyDialog();
                                return;
                              }
                              context
                                  .read<IncomeExpensesBloc>()
                                  .createIncomeExpenses(isIncome);
                              _clearForm();
                            },
                            text: 'บันทึก',
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          BlocBuilder<IncomeExpensesBloc, IncomeExpensesState>(
                            builder: (context, list) {
                              final incomeExpensesMoney =
                                  list.myAccount?.incomeExpenseMoney;
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 8, 24, 8).r,
                                child: Text(
                                  'เงินในบัญชี: ${incomeExpensesMoney ?? 0}',
                                  style: AppStyle.txtHeader3,
                                ),
                              );
                            },
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
                  child: const IncomeExpensesListWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _clearForm() {
    _cash.clear();
    _dateTime.clear();
    _detail.clear();
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

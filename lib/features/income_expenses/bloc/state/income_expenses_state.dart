import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/widgets/base_form.dart';

part 'income_expenses_state.freezed.dart';

@freezed
class IncomeExpensesState with _$IncomeExpensesState {
  const factory IncomeExpensesState({
    BaseFormData? baseFormData,
    MyAccountResponse? myAccount,
  }) = _IncomeExpensesState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';

part 'summary_state.freezed.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState({
    MyAccountResponse? myAccount,
    List<Map<String, double>>? dayList,
    List<Map<String, double>>? monthList,
    double? incomeMonthly,
    double? incomeYearly,
    double? expensesMonthly,
    double? expensesYearly,
  }) = _SummaryState;
}

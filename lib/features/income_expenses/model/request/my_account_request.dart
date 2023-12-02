import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';

part 'my_account_request.freezed.dart';
part 'my_account_request.g.dart';

@immutable
@freezed
class MyAccountRequest with _$MyAccountRequest {
  const factory MyAccountRequest({
    String? id,
    double? savingMoney,
    String? dateTime,
    double? money,
    String? detail,
    TypeIncomeExpenses? type,
    double? incomeExpensesMoney,
  }) = _MyAccountRequest;

  factory MyAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$MyAccountRequestFromJson(json);
}

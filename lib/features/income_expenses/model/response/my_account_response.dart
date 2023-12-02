import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/features/income_expenses/enum/type_income_expenses_enum.dart';

part 'my_account_response.freezed.dart';
part 'my_account_response.g.dart';

@immutable
@freezed
abstract class MyAccountResponse with _$MyAccountResponse {
  @JsonSerializable()
  const factory MyAccountResponse({
    double? savingMoney,
    double? incomeExpenseMoney,
    List<MyAccountDetailResponse>? myAccountDetail,
  }) = _MyAccountResponse;

  factory MyAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAccountResponseFromJson(json);
}

@immutable
@freezed
abstract class MyAccountDetailResponse with _$MyAccountDetailResponse {
  @JsonSerializable()
  const factory MyAccountDetailResponse({
    String? id,
    double? money,
    String? detail,
    String? dateTime,
    TypeIncomeExpenses? type,
  }) = _MyAccountDetailResponse;

  factory MyAccountDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAccountDetailResponseFromJson(json);
}

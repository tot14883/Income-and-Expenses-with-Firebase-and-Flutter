import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/widgets/base_form.dart';

part 'saving_state.freezed.dart';

@freezed
class SavingState with _$SavingState {
  const factory SavingState({
    BaseFormData? baseFormData,
    MyAccountResponse? myAccount,
  }) = _SavingState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/widgets/base_form.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    BaseFormData? baseFormData,
  }) = _AuthenticationState;
}

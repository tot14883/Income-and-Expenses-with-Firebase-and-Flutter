import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_money/widgets/base_form.dart';

part 'example_state.freezed.dart';

@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({
    BaseFormData? baseFormData,
  }) = _ExampleState;
}

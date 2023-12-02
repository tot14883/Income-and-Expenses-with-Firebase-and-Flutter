// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_expenses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomeExpensesState {
  BaseFormData? get baseFormData => throw _privateConstructorUsedError;
  MyAccountResponse? get myAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeExpensesStateCopyWith<IncomeExpensesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeExpensesStateCopyWith<$Res> {
  factory $IncomeExpensesStateCopyWith(
          IncomeExpensesState value, $Res Function(IncomeExpensesState) then) =
      _$IncomeExpensesStateCopyWithImpl<$Res, IncomeExpensesState>;
  @useResult
  $Res call({BaseFormData? baseFormData, MyAccountResponse? myAccount});

  $MyAccountResponseCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$IncomeExpensesStateCopyWithImpl<$Res, $Val extends IncomeExpensesState>
    implements $IncomeExpensesStateCopyWith<$Res> {
  _$IncomeExpensesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseFormData = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_value.copyWith(
      baseFormData: freezed == baseFormData
          ? _value.baseFormData
          : baseFormData // ignore: cast_nullable_to_non_nullable
              as BaseFormData?,
      myAccount: freezed == myAccount
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as MyAccountResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MyAccountResponseCopyWith<$Res>? get myAccount {
    if (_value.myAccount == null) {
      return null;
    }

    return $MyAccountResponseCopyWith<$Res>(_value.myAccount!, (value) {
      return _then(_value.copyWith(myAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IncomeExpensesStateImplCopyWith<$Res>
    implements $IncomeExpensesStateCopyWith<$Res> {
  factory _$$IncomeExpensesStateImplCopyWith(_$IncomeExpensesStateImpl value,
          $Res Function(_$IncomeExpensesStateImpl) then) =
      __$$IncomeExpensesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseFormData? baseFormData, MyAccountResponse? myAccount});

  @override
  $MyAccountResponseCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$$IncomeExpensesStateImplCopyWithImpl<$Res>
    extends _$IncomeExpensesStateCopyWithImpl<$Res, _$IncomeExpensesStateImpl>
    implements _$$IncomeExpensesStateImplCopyWith<$Res> {
  __$$IncomeExpensesStateImplCopyWithImpl(_$IncomeExpensesStateImpl _value,
      $Res Function(_$IncomeExpensesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseFormData = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_$IncomeExpensesStateImpl(
      baseFormData: freezed == baseFormData
          ? _value.baseFormData
          : baseFormData // ignore: cast_nullable_to_non_nullable
              as BaseFormData?,
      myAccount: freezed == myAccount
          ? _value.myAccount
          : myAccount // ignore: cast_nullable_to_non_nullable
              as MyAccountResponse?,
    ));
  }
}

/// @nodoc

class _$IncomeExpensesStateImpl implements _IncomeExpensesState {
  const _$IncomeExpensesStateImpl({this.baseFormData, this.myAccount});

  @override
  final BaseFormData? baseFormData;
  @override
  final MyAccountResponse? myAccount;

  @override
  String toString() {
    return 'IncomeExpensesState(baseFormData: $baseFormData, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeExpensesStateImpl &&
            (identical(other.baseFormData, baseFormData) ||
                other.baseFormData == baseFormData) &&
            (identical(other.myAccount, myAccount) ||
                other.myAccount == myAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseFormData, myAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeExpensesStateImplCopyWith<_$IncomeExpensesStateImpl> get copyWith =>
      __$$IncomeExpensesStateImplCopyWithImpl<_$IncomeExpensesStateImpl>(
          this, _$identity);
}

abstract class _IncomeExpensesState implements IncomeExpensesState {
  const factory _IncomeExpensesState(
      {final BaseFormData? baseFormData,
      final MyAccountResponse? myAccount}) = _$IncomeExpensesStateImpl;

  @override
  BaseFormData? get baseFormData;
  @override
  MyAccountResponse? get myAccount;
  @override
  @JsonKey(ignore: true)
  _$$IncomeExpensesStateImplCopyWith<_$IncomeExpensesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

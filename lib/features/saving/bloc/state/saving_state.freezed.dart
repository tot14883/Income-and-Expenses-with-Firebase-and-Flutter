// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavingState {
  BaseFormData? get baseFormData => throw _privateConstructorUsedError;
  MyAccountResponse? get myAccount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavingStateCopyWith<SavingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingStateCopyWith<$Res> {
  factory $SavingStateCopyWith(
          SavingState value, $Res Function(SavingState) then) =
      _$SavingStateCopyWithImpl<$Res, SavingState>;
  @useResult
  $Res call({BaseFormData? baseFormData, MyAccountResponse? myAccount});

  $MyAccountResponseCopyWith<$Res>? get myAccount;
}

/// @nodoc
class _$SavingStateCopyWithImpl<$Res, $Val extends SavingState>
    implements $SavingStateCopyWith<$Res> {
  _$SavingStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SavingStateImplCopyWith<$Res>
    implements $SavingStateCopyWith<$Res> {
  factory _$$SavingStateImplCopyWith(
          _$SavingStateImpl value, $Res Function(_$SavingStateImpl) then) =
      __$$SavingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseFormData? baseFormData, MyAccountResponse? myAccount});

  @override
  $MyAccountResponseCopyWith<$Res>? get myAccount;
}

/// @nodoc
class __$$SavingStateImplCopyWithImpl<$Res>
    extends _$SavingStateCopyWithImpl<$Res, _$SavingStateImpl>
    implements _$$SavingStateImplCopyWith<$Res> {
  __$$SavingStateImplCopyWithImpl(
      _$SavingStateImpl _value, $Res Function(_$SavingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseFormData = freezed,
    Object? myAccount = freezed,
  }) {
    return _then(_$SavingStateImpl(
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

class _$SavingStateImpl implements _SavingState {
  const _$SavingStateImpl({this.baseFormData, this.myAccount});

  @override
  final BaseFormData? baseFormData;
  @override
  final MyAccountResponse? myAccount;

  @override
  String toString() {
    return 'SavingState(baseFormData: $baseFormData, myAccount: $myAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingStateImpl &&
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
  _$$SavingStateImplCopyWith<_$SavingStateImpl> get copyWith =>
      __$$SavingStateImplCopyWithImpl<_$SavingStateImpl>(this, _$identity);
}

abstract class _SavingState implements SavingState {
  const factory _SavingState(
      {final BaseFormData? baseFormData,
      final MyAccountResponse? myAccount}) = _$SavingStateImpl;

  @override
  BaseFormData? get baseFormData;
  @override
  MyAccountResponse? get myAccount;
  @override
  @JsonKey(ignore: true)
  _$$SavingStateImplCopyWith<_$SavingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

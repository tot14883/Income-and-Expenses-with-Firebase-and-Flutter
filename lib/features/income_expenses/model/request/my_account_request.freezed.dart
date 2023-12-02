// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyAccountRequest _$MyAccountRequestFromJson(Map<String, dynamic> json) {
  return _MyAccountRequest.fromJson(json);
}

/// @nodoc
mixin _$MyAccountRequest {
  String? get id => throw _privateConstructorUsedError;
  double? get savingMoney => throw _privateConstructorUsedError;
  String? get dateTime => throw _privateConstructorUsedError;
  double? get money => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  TypeIncomeExpenses? get type => throw _privateConstructorUsedError;
  double? get incomeExpensesMoney => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyAccountRequestCopyWith<MyAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountRequestCopyWith<$Res> {
  factory $MyAccountRequestCopyWith(
          MyAccountRequest value, $Res Function(MyAccountRequest) then) =
      _$MyAccountRequestCopyWithImpl<$Res, MyAccountRequest>;
  @useResult
  $Res call(
      {String? id,
      double? savingMoney,
      String? dateTime,
      double? money,
      String? detail,
      TypeIncomeExpenses? type,
      double? incomeExpensesMoney});
}

/// @nodoc
class _$MyAccountRequestCopyWithImpl<$Res, $Val extends MyAccountRequest>
    implements $MyAccountRequestCopyWith<$Res> {
  _$MyAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? savingMoney = freezed,
    Object? dateTime = freezed,
    Object? money = freezed,
    Object? detail = freezed,
    Object? type = freezed,
    Object? incomeExpensesMoney = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      savingMoney: freezed == savingMoney
          ? _value.savingMoney
          : savingMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeIncomeExpenses?,
      incomeExpensesMoney: freezed == incomeExpensesMoney
          ? _value.incomeExpensesMoney
          : incomeExpensesMoney // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyAccountRequestImplCopyWith<$Res>
    implements $MyAccountRequestCopyWith<$Res> {
  factory _$$MyAccountRequestImplCopyWith(_$MyAccountRequestImpl value,
          $Res Function(_$MyAccountRequestImpl) then) =
      __$$MyAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      double? savingMoney,
      String? dateTime,
      double? money,
      String? detail,
      TypeIncomeExpenses? type,
      double? incomeExpensesMoney});
}

/// @nodoc
class __$$MyAccountRequestImplCopyWithImpl<$Res>
    extends _$MyAccountRequestCopyWithImpl<$Res, _$MyAccountRequestImpl>
    implements _$$MyAccountRequestImplCopyWith<$Res> {
  __$$MyAccountRequestImplCopyWithImpl(_$MyAccountRequestImpl _value,
      $Res Function(_$MyAccountRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? savingMoney = freezed,
    Object? dateTime = freezed,
    Object? money = freezed,
    Object? detail = freezed,
    Object? type = freezed,
    Object? incomeExpensesMoney = freezed,
  }) {
    return _then(_$MyAccountRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      savingMoney: freezed == savingMoney
          ? _value.savingMoney
          : savingMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeIncomeExpenses?,
      incomeExpensesMoney: freezed == incomeExpensesMoney
          ? _value.incomeExpensesMoney
          : incomeExpensesMoney // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyAccountRequestImpl implements _MyAccountRequest {
  const _$MyAccountRequestImpl(
      {this.id,
      this.savingMoney,
      this.dateTime,
      this.money,
      this.detail,
      this.type,
      this.incomeExpensesMoney});

  factory _$MyAccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyAccountRequestImplFromJson(json);

  @override
  final String? id;
  @override
  final double? savingMoney;
  @override
  final String? dateTime;
  @override
  final double? money;
  @override
  final String? detail;
  @override
  final TypeIncomeExpenses? type;
  @override
  final double? incomeExpensesMoney;

  @override
  String toString() {
    return 'MyAccountRequest(id: $id, savingMoney: $savingMoney, dateTime: $dateTime, money: $money, detail: $detail, type: $type, incomeExpensesMoney: $incomeExpensesMoney)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAccountRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.savingMoney, savingMoney) ||
                other.savingMoney == savingMoney) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.incomeExpensesMoney, incomeExpensesMoney) ||
                other.incomeExpensesMoney == incomeExpensesMoney));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, savingMoney, dateTime, money,
      detail, type, incomeExpensesMoney);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAccountRequestImplCopyWith<_$MyAccountRequestImpl> get copyWith =>
      __$$MyAccountRequestImplCopyWithImpl<_$MyAccountRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyAccountRequestImplToJson(
      this,
    );
  }
}

abstract class _MyAccountRequest implements MyAccountRequest {
  const factory _MyAccountRequest(
      {final String? id,
      final double? savingMoney,
      final String? dateTime,
      final double? money,
      final String? detail,
      final TypeIncomeExpenses? type,
      final double? incomeExpensesMoney}) = _$MyAccountRequestImpl;

  factory _MyAccountRequest.fromJson(Map<String, dynamic> json) =
      _$MyAccountRequestImpl.fromJson;

  @override
  String? get id;
  @override
  double? get savingMoney;
  @override
  String? get dateTime;
  @override
  double? get money;
  @override
  String? get detail;
  @override
  TypeIncomeExpenses? get type;
  @override
  double? get incomeExpensesMoney;
  @override
  @JsonKey(ignore: true)
  _$$MyAccountRequestImplCopyWith<_$MyAccountRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

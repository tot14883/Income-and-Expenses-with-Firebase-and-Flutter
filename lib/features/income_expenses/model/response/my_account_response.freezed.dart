// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyAccountResponse _$MyAccountResponseFromJson(Map<String, dynamic> json) {
  return _MyAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$MyAccountResponse {
  double? get savingMoney => throw _privateConstructorUsedError;
  double? get incomeExpenseMoney => throw _privateConstructorUsedError;
  List<MyAccountDetailResponse>? get myAccountDetail =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyAccountResponseCopyWith<MyAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountResponseCopyWith<$Res> {
  factory $MyAccountResponseCopyWith(
          MyAccountResponse value, $Res Function(MyAccountResponse) then) =
      _$MyAccountResponseCopyWithImpl<$Res, MyAccountResponse>;
  @useResult
  $Res call(
      {double? savingMoney,
      double? incomeExpenseMoney,
      List<MyAccountDetailResponse>? myAccountDetail});
}

/// @nodoc
class _$MyAccountResponseCopyWithImpl<$Res, $Val extends MyAccountResponse>
    implements $MyAccountResponseCopyWith<$Res> {
  _$MyAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savingMoney = freezed,
    Object? incomeExpenseMoney = freezed,
    Object? myAccountDetail = freezed,
  }) {
    return _then(_value.copyWith(
      savingMoney: freezed == savingMoney
          ? _value.savingMoney
          : savingMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      incomeExpenseMoney: freezed == incomeExpenseMoney
          ? _value.incomeExpenseMoney
          : incomeExpenseMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      myAccountDetail: freezed == myAccountDetail
          ? _value.myAccountDetail
          : myAccountDetail // ignore: cast_nullable_to_non_nullable
              as List<MyAccountDetailResponse>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyAccountResponseImplCopyWith<$Res>
    implements $MyAccountResponseCopyWith<$Res> {
  factory _$$MyAccountResponseImplCopyWith(_$MyAccountResponseImpl value,
          $Res Function(_$MyAccountResponseImpl) then) =
      __$$MyAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? savingMoney,
      double? incomeExpenseMoney,
      List<MyAccountDetailResponse>? myAccountDetail});
}

/// @nodoc
class __$$MyAccountResponseImplCopyWithImpl<$Res>
    extends _$MyAccountResponseCopyWithImpl<$Res, _$MyAccountResponseImpl>
    implements _$$MyAccountResponseImplCopyWith<$Res> {
  __$$MyAccountResponseImplCopyWithImpl(_$MyAccountResponseImpl _value,
      $Res Function(_$MyAccountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savingMoney = freezed,
    Object? incomeExpenseMoney = freezed,
    Object? myAccountDetail = freezed,
  }) {
    return _then(_$MyAccountResponseImpl(
      savingMoney: freezed == savingMoney
          ? _value.savingMoney
          : savingMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      incomeExpenseMoney: freezed == incomeExpenseMoney
          ? _value.incomeExpenseMoney
          : incomeExpenseMoney // ignore: cast_nullable_to_non_nullable
              as double?,
      myAccountDetail: freezed == myAccountDetail
          ? _value._myAccountDetail
          : myAccountDetail // ignore: cast_nullable_to_non_nullable
              as List<MyAccountDetailResponse>?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MyAccountResponseImpl implements _MyAccountResponse {
  const _$MyAccountResponseImpl(
      {this.savingMoney,
      this.incomeExpenseMoney,
      final List<MyAccountDetailResponse>? myAccountDetail})
      : _myAccountDetail = myAccountDetail;

  factory _$MyAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyAccountResponseImplFromJson(json);

  @override
  final double? savingMoney;
  @override
  final double? incomeExpenseMoney;
  final List<MyAccountDetailResponse>? _myAccountDetail;
  @override
  List<MyAccountDetailResponse>? get myAccountDetail {
    final value = _myAccountDetail;
    if (value == null) return null;
    if (_myAccountDetail is EqualUnmodifiableListView) return _myAccountDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyAccountResponse(savingMoney: $savingMoney, incomeExpenseMoney: $incomeExpenseMoney, myAccountDetail: $myAccountDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAccountResponseImpl &&
            (identical(other.savingMoney, savingMoney) ||
                other.savingMoney == savingMoney) &&
            (identical(other.incomeExpenseMoney, incomeExpenseMoney) ||
                other.incomeExpenseMoney == incomeExpenseMoney) &&
            const DeepCollectionEquality()
                .equals(other._myAccountDetail, _myAccountDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, savingMoney, incomeExpenseMoney,
      const DeepCollectionEquality().hash(_myAccountDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAccountResponseImplCopyWith<_$MyAccountResponseImpl> get copyWith =>
      __$$MyAccountResponseImplCopyWithImpl<_$MyAccountResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _MyAccountResponse implements MyAccountResponse {
  const factory _MyAccountResponse(
          {final double? savingMoney,
          final double? incomeExpenseMoney,
          final List<MyAccountDetailResponse>? myAccountDetail}) =
      _$MyAccountResponseImpl;

  factory _MyAccountResponse.fromJson(Map<String, dynamic> json) =
      _$MyAccountResponseImpl.fromJson;

  @override
  double? get savingMoney;
  @override
  double? get incomeExpenseMoney;
  @override
  List<MyAccountDetailResponse>? get myAccountDetail;
  @override
  @JsonKey(ignore: true)
  _$$MyAccountResponseImplCopyWith<_$MyAccountResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyAccountDetailResponse _$MyAccountDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _MyAccountDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$MyAccountDetailResponse {
  String? get id => throw _privateConstructorUsedError;
  double? get money => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  String? get dateTime => throw _privateConstructorUsedError;
  TypeIncomeExpenses? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyAccountDetailResponseCopyWith<MyAccountDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAccountDetailResponseCopyWith<$Res> {
  factory $MyAccountDetailResponseCopyWith(MyAccountDetailResponse value,
          $Res Function(MyAccountDetailResponse) then) =
      _$MyAccountDetailResponseCopyWithImpl<$Res, MyAccountDetailResponse>;
  @useResult
  $Res call(
      {String? id,
      double? money,
      String? detail,
      String? dateTime,
      TypeIncomeExpenses? type});
}

/// @nodoc
class _$MyAccountDetailResponseCopyWithImpl<$Res,
        $Val extends MyAccountDetailResponse>
    implements $MyAccountDetailResponseCopyWith<$Res> {
  _$MyAccountDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? money = freezed,
    Object? detail = freezed,
    Object? dateTime = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeIncomeExpenses?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyAccountDetailResponseImplCopyWith<$Res>
    implements $MyAccountDetailResponseCopyWith<$Res> {
  factory _$$MyAccountDetailResponseImplCopyWith(
          _$MyAccountDetailResponseImpl value,
          $Res Function(_$MyAccountDetailResponseImpl) then) =
      __$$MyAccountDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      double? money,
      String? detail,
      String? dateTime,
      TypeIncomeExpenses? type});
}

/// @nodoc
class __$$MyAccountDetailResponseImplCopyWithImpl<$Res>
    extends _$MyAccountDetailResponseCopyWithImpl<$Res,
        _$MyAccountDetailResponseImpl>
    implements _$$MyAccountDetailResponseImplCopyWith<$Res> {
  __$$MyAccountDetailResponseImplCopyWithImpl(
      _$MyAccountDetailResponseImpl _value,
      $Res Function(_$MyAccountDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? money = freezed,
    Object? detail = freezed,
    Object? dateTime = freezed,
    Object? type = freezed,
  }) {
    return _then(_$MyAccountDetailResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as double?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeIncomeExpenses?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MyAccountDetailResponseImpl implements _MyAccountDetailResponse {
  const _$MyAccountDetailResponseImpl(
      {this.id, this.money, this.detail, this.dateTime, this.type});

  factory _$MyAccountDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyAccountDetailResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final double? money;
  @override
  final String? detail;
  @override
  final String? dateTime;
  @override
  final TypeIncomeExpenses? type;

  @override
  String toString() {
    return 'MyAccountDetailResponse(id: $id, money: $money, detail: $detail, dateTime: $dateTime, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAccountDetailResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, money, detail, dateTime, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAccountDetailResponseImplCopyWith<_$MyAccountDetailResponseImpl>
      get copyWith => __$$MyAccountDetailResponseImplCopyWithImpl<
          _$MyAccountDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyAccountDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _MyAccountDetailResponse implements MyAccountDetailResponse {
  const factory _MyAccountDetailResponse(
      {final String? id,
      final double? money,
      final String? detail,
      final String? dateTime,
      final TypeIncomeExpenses? type}) = _$MyAccountDetailResponseImpl;

  factory _MyAccountDetailResponse.fromJson(Map<String, dynamic> json) =
      _$MyAccountDetailResponseImpl.fromJson;

  @override
  String? get id;
  @override
  double? get money;
  @override
  String? get detail;
  @override
  String? get dateTime;
  @override
  TypeIncomeExpenses? get type;
  @override
  @JsonKey(ignore: true)
  _$$MyAccountDetailResponseImplCopyWith<_$MyAccountDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductItemResponse _$ProductItemResponseFromJson(Map<String, dynamic> json) {
  return _ProductItemResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductItemResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemResponseCopyWith<ProductItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemResponseCopyWith<$Res> {
  factory $ProductItemResponseCopyWith(
          ProductItemResponse value, $Res Function(ProductItemResponse) then) =
      _$ProductItemResponseCopyWithImpl<$Res, ProductItemResponse>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$ProductItemResponseCopyWithImpl<$Res, $Val extends ProductItemResponse>
    implements $ProductItemResponseCopyWith<$Res> {
  _$ProductItemResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductItemResponseImplCopyWith<$Res>
    implements $ProductItemResponseCopyWith<$Res> {
  factory _$$ProductItemResponseImplCopyWith(_$ProductItemResponseImpl value,
          $Res Function(_$ProductItemResponseImpl) then) =
      __$$ProductItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$ProductItemResponseImplCopyWithImpl<$Res>
    extends _$ProductItemResponseCopyWithImpl<$Res, _$ProductItemResponseImpl>
    implements _$$ProductItemResponseImplCopyWith<$Res> {
  __$$ProductItemResponseImplCopyWithImpl(_$ProductItemResponseImpl _value,
      $Res Function(_$ProductItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$ProductItemResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ProductItemResponseImpl implements _ProductItemResponse {
  const _$ProductItemResponseImpl({required this.id, required this.title});

  factory _$ProductItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'ProductItemResponse(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemResponseImplCopyWith<_$ProductItemResponseImpl> get copyWith =>
      __$$ProductItemResponseImplCopyWithImpl<_$ProductItemResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductItemResponse implements ProductItemResponse {
  const factory _ProductItemResponse(
      {required final int id,
      required final String title}) = _$ProductItemResponseImpl;

  factory _ProductItemResponse.fromJson(Map<String, dynamic> json) =
      _$ProductItemResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemResponseImplCopyWith<_$ProductItemResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

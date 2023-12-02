import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_item_response.freezed.dart';
part 'product_item_response.g.dart';

@immutable
@freezed
abstract class ProductItemResponse with _$ProductItemResponse {
  @JsonSerializable()
  const factory ProductItemResponse({
    required int id,
    required String title,
  }) = _ProductItemResponse;

  factory ProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductItemResponseFromJson(json);
}

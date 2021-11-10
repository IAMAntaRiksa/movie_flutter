import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class ListResponse<T> {
  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'results')
  final List<T>? result;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResult;
  ListResponse({
    this.page,
    this.result,
    this.totalPages,
    this.totalResult,
  });

  factory ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);
}

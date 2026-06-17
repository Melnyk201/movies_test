import 'package:json_annotation/json_annotation.dart';
import 'package:movies_test/shared/models/movie_model.dart';

part 'movie_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieListModel {
  final List<MovieModel> results;
  final int page;
  final int totalPages;
  final int totalResults;

  const MovieListModel({
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListModelToJson(this);
}

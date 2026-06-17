import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel {
  final int? id;
  final String? posterPath;
  final String title;
  final double voteAverage;
  final String? overview;
  final String? releaseDate;

  const MovieModel({
    this.id,
    this.posterPath,
    required this.title,
    required this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

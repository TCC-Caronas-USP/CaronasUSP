import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Location {
  final String id;
  final String description;
  final double lat;
  final double lon;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  const Location({
    required this.id,
    required this.description,
    required this.lat,
    required this.lon
  });
}
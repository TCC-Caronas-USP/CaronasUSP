import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Location {
  int? id;
  final String address;
  final double lat;
  final double lon;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  Location({
    this.id,
    required this.address,
    required this.lat,
    required this.lon,
  });
}
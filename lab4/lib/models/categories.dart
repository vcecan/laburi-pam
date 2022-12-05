
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';


@JsonSerializable()
class Categoie{
  final String title;
  final String icon;

  Categoie({required this.title,required this.icon});

  factory Categoie.fromJson(Map<String, dynamic> json) => _$CategoieFromJson(json);

  Map<String, dynamic> toJson() => _$CategoieToJson(this);
}
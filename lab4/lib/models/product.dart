
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String cover;
  final String title;
  @JsonKey(name: 'sub_title')
  final String subtitle;
  final int? price;
  final String currency;
  @JsonKey(ignore: true)
   String get finalprice => price.toString()+" "+currency;

  Product({required this.cover,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.currency});


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);


}


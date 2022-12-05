// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      cover: json['cover'] as String,
      title: json['title'] as String,
      subtitle: json['sub_title'] as String,
      price: json['price'] as int?,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'cover': instance.cover,
      'title': instance.title,
      'sub_title': instance.subtitle,
      'price': instance.price,
      'currency': instance.currency,
    };

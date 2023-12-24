// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NewProduct {
  String title;
  String description;
  num price;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  NewProduct({
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  NewProduct copyWith({
    String? title,
    String? description,
    num? price,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return NewProduct(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory NewProduct.fromMap(Map<String, dynamic> map) {
    return NewProduct(
        title: map['title'] as String,
        description: map['description'] as String,
        price: map['price'] as num,
        brand: map['brand'] as String,
        category: map['category'] as String,
        thumbnail: map['thumbnail'] as String,
        images: List<String>.from(
          (map['images'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory NewProduct.fromJson(String source) =>
      NewProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddProduct(title: $title, description: $description, price: $price, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(covariant NewProduct other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.price == price &&
        other.brand == brand &&
        other.category == category &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        brand.hashCode ^
        category.hashCode ^
        thumbnail.hashCode ^
        images.hashCode;
  }
}

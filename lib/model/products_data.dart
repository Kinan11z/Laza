// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Products_data {
  num id;
  String title;
  String description;
  num price;
  num discountPercentage;
  num rating;
  num stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  Products_data({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Products_data copyWith({
    num? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) {
    return Products_data(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory Products_data.fromMap(Map<String, dynamic> map) {
    return Products_data(
        id: map['id'] as num,
        title: map['title'] as String,
        description: map['description'] as String,
        price: map['price'] as num,
        discountPercentage: map['discountPercentage'] as num,
        rating: map['rating'] as num,
        stock: map['stock'] as num,
        brand: map['brand'] as String,
        category: map['category'] as String,
        thumbnail: map['thumbnail'] as String,
        images: List<String>.from(
          (map['images'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Products_data.fromJson(String source) =>
      Products_data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products_data(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images)';
  }

  @override
  bool operator ==(covariant Products_data other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.rating == rating &&
        other.stock == stock &&
        other.brand == brand &&
        other.category == category &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        discountPercentage.hashCode ^
        rating.hashCode ^
        stock.hashCode ^
        brand.hashCode ^
        category.hashCode ^
        thumbnail.hashCode ^
        images.hashCode;
  }
}

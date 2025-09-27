import 'package:task3/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: (json['title'] ?? '') as String,
      price: (json['price'] ?? '') as double,
      description: json['releaseDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'price': price,
      'description': description,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    return {
      'title': name,
      'id': price,
      'releaseDate': description,
    };
  }

  ProductModel copywith({
    String? id,
    String? name,
    String? description,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}


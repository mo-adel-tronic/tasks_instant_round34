import 'package:task4/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: (json['title'] ?? json['name'] ?? '') as String,
      description: (json['description'] ?? '') as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description, 'price': price};
  }

  Map<String, dynamic> toJsonForCreate() {
    return {'name': name, 'description': description, 'price': price};
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }
}

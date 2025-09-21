import 'package:task7/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price']);
  }

  Map<String, dynamic> json() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
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
        description: description ?? this.description,
        price: price ?? this.price);
  }
}


import 'package:r34_30/features/product/domin/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: (json['title'] ?? '') as String,
      price: json['price'].toDouble(),
      description: (json['description'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
    };
  }

  Map<String, dynamic> toJsonForCreate() {
    return {'title': title, 'price': price, 'description': description};
  }

  ProductModel copyWith({
    String? id,
    String? title,
    double? price,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}

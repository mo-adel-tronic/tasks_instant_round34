import 'package:task7/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'].toString(),
        title: json['title'],
        description: json['description'],
price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0).toDouble(),        
        
        );
  }

  Map<String, dynamic> json() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
    };
  }
  Map<String, dynamic> toJsonForCreate() {
    return {
     'title': title,
      'description': description,
      'price': price,
    };
  }

  ProductModel copywith({
    String? id,
    String? title,
    String? description,
    double? price,
  }) {
    return ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price);
  }
}


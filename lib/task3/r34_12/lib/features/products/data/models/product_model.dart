import 'package:r34_12/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,

  });
  //from json to List | Map
  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'], 
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      );
  }

  //from List | Map to object
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,

    };
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

ProductModel productModel = const ProductModel(
  id: '1', 
  name: 'product 1', 
  description: 'Description 1', 
  price: 10.0,
);

void main(){
  print(productModel.copyWith());
}

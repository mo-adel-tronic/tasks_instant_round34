import 'package:r34_22/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
   required super.description,
    required super.price, 

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(), 
      description:json['descreption'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }


ProductModel copywith({String? id,String? name,String? descreption,double? price}){
  return ProductModel(
    id:id??this.id,
    name: name??this.name,
    description: descreption??this.description,
    price: price??this.price
  );
}
}
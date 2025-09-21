import 'package:r34_02/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.description,
  });

  //factory to return object,, and using named constructor (because we send different data on constructor)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }

  //return map that will used in jsonEncode
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price, 'description': description};
  }

  /*
create an instance from instance => use it in update,create product
    id : id ?? this.id means id = newId or oldId
 */
  ProductModel copyWith({
    String? newId,
    String? newName,
    double? newPrice,
    String? newDescription,
  }) {
    return ProductModel(
      id: newId ?? id,
      name: newName ?? name,
      price: newPrice ?? price,
      description: newDescription ?? description,
    );
  }
}

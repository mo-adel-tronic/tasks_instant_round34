import 'package:r34_01/features/user/domain/entity/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.name,
    required super.id,
    required super.description,
    required super.price,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      id: json['id'],
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'price': price};
  }

  UserModel copyWith({
    String? name,
    String? id,
    String? description,
    double? price,
  }) {
    return UserModel(
      name: name ?? this.name,
      description: description ?? this.description,
      id: id ?? this.id,
      price: price ?? this.price,
    );
  }
}
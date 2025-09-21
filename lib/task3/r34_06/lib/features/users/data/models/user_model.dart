import 'package:task7/features/users/domain/entities/user.dart';

class UsersModel extends User {
  UsersModel({required super.id, required super.name, required super.email, required super.password});
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    
      return UsersModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> json() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
    UsersModel copywith({
    String? id,
    String? name,
    String? email,
    double? password,
  }) {
    return UsersModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
import 'package:task3/features/user/domin/entities/user.dart';

class UsersModel extends User {

  UsersModel({required super.id, required super.name, required super.email});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
      return UsersModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );
  } 
  Map<String, dynamic> json() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
    UsersModel copywith({
    String? id,
    String? name,
    String? email,
  }) {
    return UsersModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );
  }
}

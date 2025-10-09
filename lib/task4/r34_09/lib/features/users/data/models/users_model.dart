import 'package:task7/features/users/domain/entities/user.dart';

class UsersModel extends User {
  UsersModel({
    required super.id,
    required super.firstName,
    required super.email,
    required super.password,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'].toString(),
      firstName: json['firstName'],
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJsonForCreate() {
    return {
     'title': firstName,
      'description': email,
      'price': password,
    };
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'password': password,
    };
  }

  UsersModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return UsersModel(
      id: id ?? this.id,
      firstName: name ?? this.firstName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

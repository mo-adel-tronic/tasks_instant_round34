import 'package:r34_02/features/users/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'gender': gender};
  }

  UserModel copyWith({
    String? newId,
    String? newName,
    String? newEmail,
    String? newGender,
  }) {
    return UserModel(
      id: newId ?? id,
      name: newName ?? name,
      email: newEmail ?? email,
      gender: newGender ?? gender,
    );
  }
}

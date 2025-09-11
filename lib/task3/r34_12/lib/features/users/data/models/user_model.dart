import 'package:r34_12/features/users/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  // from json to object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  // from object to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}

final UserModel userModel = const UserModel(
  id: '1',
  name: 'User 1',
  email: 'user1@example.com',
);

void main() {
  print(userModel.copyWith());
}
import 'package:task4/features/users/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      firstName: (json['firstName'] ?? '') as String,
      email: (json['email'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'firstName': firstName, 'email': email};
  }

  Map<String, dynamic> toJsonForCreate() {
    return {'firstName': firstName, 'email': email};
  }

  UserModel copyWith({String? id, String? firstName, String? email}) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }
}

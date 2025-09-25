import 'package:r34_01/features/user/domain/entity/user_entity.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
    );
  }
  Map<String, dynamic> tojson() {
    return {'id': id, 'firstName': firstName, 'email': email};
  }

  Map<String, dynamic> toJsonForCreate() {
    return {'firstName': firstName, 'email': email};
  }

  UserModel copywith({String? id, String? firstName, String? email}) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }
}
import 'package:r34_30/features/user/domin/entities/user.dart';

class UsersModel extends User {
  UsersModel({
    required super.id,
    required super.firstName,
    required super.email,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
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

  UsersModel copywith({String? id, String? firstName, String? email}) {
    return UsersModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
    );
  }
}

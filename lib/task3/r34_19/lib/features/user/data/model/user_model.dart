import '../../domain/entity/user.dart';
class UserModel extends User {
  UserModel({required String id, required String name}) : super(id: id, name: name);
  factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(id: json['id'], name: json['name']);
  Map<String,dynamic> toJson() => {'id': id, 'name': name};
}

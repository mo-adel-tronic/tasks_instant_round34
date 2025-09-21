import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String gender;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
  });

  @override
  List<Object?> get props => [name, email, gender];
}

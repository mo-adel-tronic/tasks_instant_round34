import 'package:equatable/equatable.dart';

class Product extends Equatable {
    final String id;
  final String title;
  final String description;
  final double price;


  const Product({required this.id,
  required this.title,
  required this.description,
  required this.price});
  @override
  List<Object?> get props => [id,title,description,price];
}

import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String id;
  final String descreption;
  final double price;
  
  const Product({required this.name,required this.id,required this.descreption,required this.price});

 @override
  List <Object?> get props=>[name,id,descreption,price];
}
import 'dart:io';

import 'package:r34_22/features/products/presentation/services/product_console_service.dart';

class Productmenu{
  final ProductConsoleServices _productservies;
  Productmenu(this._productservies);
  void showmenu(){
    subloop:while(true){
      print("\n===Product Management System===");
      print("1. List your Product");
      print("2. veiw product details");
      print("3. create new product");
      print("4. update product");
      print("5. delete product");
      print("6. Exit");
      print("Enter your choice (1-6): ");

    final choice=stdin.readLineSync();
    switch(choice){
      case "1": _productservies.displayallproduct();
      break;
      case "2": _veiwproduct();
      break;
      case "3": _createproduct();
      break;
      case "4": _updataproduct();
      break;
      case "5": _deleteproduct();
      break;
      case "6": print("Goodbye");
      break subloop;
      default: print("invalid choice, please try again");

    }

    }
  }
  void _veiwproduct(){
  print("Enter your id: ");
  final id= stdin.readLineSync();
  if(id!=null&&id.isNotEmpty){
    _productservies.displayproduct(id);
  }
  }
  void _createproduct(){
    print("Enter product name: ");
    final name=stdin.readLineSync();
    print("Enter product description: ");
    final description=stdin.readLineSync();
    print("Enter product price: ");
    final pricestr=stdin.readLineSync();
    if(name!=null&&name.isNotEmpty&&description!=null&&description.isNotEmpty&&pricestr!=null&&pricestr.isNotEmpty){
      try{
        final price=double.parse(pricestr);
        _productservies.createproduct(name, description, price);
      }catch(e){
        print('invalid price format.please enter the valid number');
      }
    }else{
      print("All fields are required");
    }
  }
  void _updataproduct(){
    print('Enter the id to update: ');
    final id=stdin.readLineSync(); 
    print("Enter new product name: ");
    final name=stdin.readLineSync();
    print("Enter new product description: ");
    final description=stdin.readLineSync();
    print("Enter new product price: ");
    final pricestr=stdin.readLineSync();
    if(id!=null&&id.isNotEmpty&& name!=null&&name.isNotEmpty&&description!=null&&description.isNotEmpty&&pricestr!=null&&pricestr.isNotEmpty){
      try{
        final price=double.parse(pricestr);
        _productservies.updateproduct(id, name, description, price);
      }catch(e){
        print('invalid price format.please enter the valid number');
      }
    }else{
      print("All fields are required");
    }
  }
  void _deleteproduct(){
    print("Enter product id to delete: ");
    final id=stdin.readLineSync();
    if(id!=null&&id.isNotEmpty){
      _productservies.deleteProduct(id);
    }
  }
} 
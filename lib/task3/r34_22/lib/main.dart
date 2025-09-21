import 'dart:io';
import 'package:r34_22/features/products/presentation/console/product_menu.dart';
import 'package:r34_22/features/products/presentation/services/product_console_service.dart';
import 'package:r34_22/features/user/presentation/console/user_menu.dart';
import 'package:r34_22/features/user/presentation/service/user_console_service.dart';

import 'injection_container.dart' as di;
void main(){
  print('initializing CRUD system...');
  di.init();
  print("system initialized successfully.");

  final productmenu=Productmenu(di.sl<ProductConsoleServices>());
  final usermenu=UserMenu(di.sl<UserConsoleServices>());
  _showmainmenu(productmenu, usermenu);
}

void _showmainmenu(Productmenu productmenu , UserMenu usermenu ,){
  while(true){
    print("\n===Main Menu=== ");
    print("1. Product Menu");
    print("2. User Menu");
    print("4. Exit");
    print("Enter your choice(1-4): ");
    final choice=stdin.readLineSync();

    switch(choice){
      case "1":
      productmenu.showmenu();
      break;
      case "2":
      usermenu.showMenu();
      break;
      case "":
      print("goodbye");
      exit(0);
      default:
      print("invalid choice, try again.");
    }

  }
}
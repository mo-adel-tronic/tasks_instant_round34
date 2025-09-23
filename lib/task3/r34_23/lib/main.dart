import 'dart:io';
import 'package:r34_23/features/posts/presentation/console/post_menu.dart';
import 'package:r34_23/features/posts/presentation/services/post_console_services.dart';
import 'package:r34_23/features/products/presentation/console/product_menu.dart';
import 'package:r34_23/features/products/presentation/services/product_console_services.dart';
import 'package:r34_23/features/users/presentation/console/user_menu.dart';
import 'package:r34_23/features/users/presentation/services/user_console_services.dart';

import 'injection_container.dart' as di;
void main(){
  print('initializing CRUD system...');
  di.init();
  print("system initialized successfully.");

  final productmenu=Productmenu(di.sl<ProductConsoleServices>());
  final usermenu=UserMenu(di.sl<UserConsoleServices>());
  final postmenu=PostMenu(di.sl<PostConsoleServices>());
  _showmainmenu(productmenu, usermenu, postmenu);
}

void _showmainmenu(Productmenu productmenu , UserMenu usermenu , PostMenu postmenu){
  while(true){
    print("\n===Main Menu=== ");
    print("1. Product Menu");
    print("2. User Menu");
    print("3. Posts Menu");
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
      case "3":
      postmenu.showMenu();
      break;
      case "4":
      print("goodbye");
      exit(0);
      default:
      print("invalid choice, try again.");
    }
      
  }
}
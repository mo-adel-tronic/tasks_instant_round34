import 'dart:io';

import 'package:task7/features/users/presentation/console/user_menu.dart';
import 'package:task7/features/users/presentation/services/user_console_service.dart';

import 'package:task7/features/posts/presentation/console/post_menu.dart';
import 'package:task7/features/posts/presentation/services/post_console_service.dart';

import 'package:task7/features/products/presentation/console/product_menu.dart';
import 'package:task7/features/products/presentation/services/product_console_service.dart';

import 'features/injection_container.dart' as di;

 void main() async {
  di.init(); // تشغيل الـ Dependency Injection
  print("=== Main Menu ===");

  while (true) {
    print("\nاختر من القائمة:");
    print("1. Users");
    print("2. Posts");
    print("3. Products");
    print("4. Exit");

    stdout.write("ادخل اختيارك (1-4): ");
    final choice = stdin.readLineSync();

   mainswitch: switch (choice) {
      case '1':
        final userMenu = UserMenu(di.sl<UserConsoleService>());
        await userMenu.showMenu();
        break;
      case '2':
        final postMenu = PostMenu(di.sl<PostConsoleService>());
        await postMenu.showMenu();
        break;
      case '3':
        final productMenu = ProductMenu(di.sl<ProductConsoleService>());
        await productMenu.showMenu();
        break;
      case '4':
        print("Exiting program...");
        exit(0);
      default:
        print("خيار غير صحيح، حاول مرة أخرى.");
    }
  }
}

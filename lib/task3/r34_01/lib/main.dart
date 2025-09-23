import 'dart:io';
import 'package:r34_01/features/book/presentation/console/book_menu.dart';
import 'package:r34_01/features/book/presentation/services/book_console_service.dart';
import 'package:r34_01/features/post/presentation/console/post_menu.dart';
import 'package:r34_01/features/post/presentation/services/post_console_service.dart';
import 'package:r34_01/features/user/presentation/console/user_menu.dart';
import 'package:r34_01/features/user/presentation/services/user_console_service.dart';
import 'package:r34_01/injection_container.dart' as di;

void main() {
  print('Initializing CRUD Management System...');
  di.init();
  print('System initialized successfully!');

  final bookMenu = BookMenu(di.s1<BookConsoleService>());
  final postMenu = PostMenu(di.s1<PostConsoleService>());
  final userMenu = UserMenu(di.s1<UserConsoleService>());

  _showMainMenu(bookMenu, postMenu, userMenu);
}

void _showMainMenu(BookMenu bookMenu, PostMenu postMenu, UserMenu userMenu) {
  while (true) {
    print('\n=== MAIN MENU ===');
    print('1. Book Management');
    print('2. Post Management');
    print('3. User Management');
    print('4. Exit');
    print('Enter your choice (1-4): ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        bookMenu.showMenu();
        break;
      case '2':
        postMenu.showMenu();
        break;
      case '3':
        userMenu.showMenu();
        break;
      case '4':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice, try again.');
    }
  }
}

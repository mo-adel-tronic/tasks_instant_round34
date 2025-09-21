import 'dart:io';
import 'package:r34_24/features/book/presentation/console/book_menu.dart';
import 'package:r34_24/features/book/presentation/services/book_console_service.dart';
import 'package:r34_24/features/posts/presentation/console/post_menu.dart';
import 'package:r34_24/features/posts/presentation/services/post_console_service.dart';
import 'package:r34_24/features/user/presentation/console/user_menu.dart';
import 'package:r34_24/features/user/presentation/services/user_console_services.dart';
import 'injection_container.dart' as di;

void main() {
  print('Initializing System...');
  di.init();
  print('System initialized successfully');

  final bookMenu = BookMenu(di.sl<BookConsoleService>());
  final postMenu = PostMenu(di.sl<PostConsoleService>());
  final userMenu = UserMenu(di.sl<UserConsoleService>());

  while (true) {
    print('\n====== Main Menu ======');
    print('1.  Books');
    print('2.  Posts');
    print('3. User');
    print('4. Exit');
    stdout.write('Enter your choice (1-4): ');

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
        print('Exiting application...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

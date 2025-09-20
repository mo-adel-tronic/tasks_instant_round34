import 'package:r34_02/features/main_menu/pressentation/console/main_menu.dart';
import 'package:r34_02/features/posts/presentation/console/post_menu.dart';
import 'package:r34_02/features/products/presentation/console/product_menu.dart';
import 'package:r34_02/features/users/presentation/console/user_menu.dart';
import 'package:r34_02/features/posts/presentation/services/post_console_service.dart';
import 'package:r34_02/features/products/presentation/services/product_console_service.dart';
import 'package:r34_02/features/users/presentation/services/user_console_service.dart';
import 'injection_container.dart' as my_container;

void main() {
  //initialize dependency injection
  my_container.init();

  //Start Menus
  final productMenu = ProductMenu(my_container.sl<ProductConsoleService>());
  final postMenu = PostMenu(my_container.sl<PostConsoleService>());
  final userMenu = UserMenu(my_container.sl<UserConsoleService>());

  final mainMenu = MainMenu(postMenu, productMenu, userMenu);

  mainMenu.showMainMenu();
}

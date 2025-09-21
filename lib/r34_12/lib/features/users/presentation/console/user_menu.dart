import 'dart:io';
import 'dart:async';
import 'package:r34_12/features/users/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userService;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  UserMenu(this._userService) {
    _loadingSub = _userService.lodingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _showSpinnerWhileLoading();
      }
    });
  }

  Future<void> showMenu() async {
    menuLoop: while (true) {
      print("\n== User MANAGEMENT SYSTEM ==");
      print('1. List all users');
      print('2. View user details');
      print('3. Create new user');
      print('4. Update user');
      print('5. Delete user');
      print('6. Back to main menu');
      stdout.write('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await _userService.displayAllUsers();
          break;
        case '2':
          await _viewUser();
          break;
        case '3':
          await _createUser();
          break;
        case '4':
          await _updateUser();
          break;
        case '5':
          await _deleteUser();
          break;
        case '6':
          print('Returning to main menu...');
          break menuLoop; 
        default:
          print('Invalid choice. Please try again.');
      }
    }

    await _loadingSub?.cancel(); 
  }

  Future<void> _viewUser() async {
    stdout.write('Enter user ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userService.displayUser(id);
    } else {
      print('User ID is required.');
    }
  }

  Future<void> _createUser() async {
    stdout.write('Enter user name: ');
    final name = stdin.readLineSync();
    stdout.write('Enter user email: ');
    final email = stdin.readLineSync();
    
    if (name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty 
      ) {
      try {
        
        await _userService.createUser(name, email);
      } catch (e) {
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _updateUser() async {
    stdout.write('Enter user ID to update: ');
    final id = stdin.readLineSync();
    stdout.write('Enter new user name: ');
    final name = stdin.readLineSync();
    stdout.write('Enter new user email: ');
    final email = stdin.readLineSync();
    

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty 
        ) {
      try {
        
        await _userService.updateUser(id, name, email);
      } catch (e) {
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _deleteUser() async {
    stdout.write('Enter user ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userService.deleteUser(id);
    } else {
      print('user ID is required.');
    }
  }

  void _showSpinnerWhileLoading() {
    
    print("Loading... Please wait.");
  }
}

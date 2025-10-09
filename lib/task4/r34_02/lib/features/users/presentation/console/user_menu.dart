import 'dart:async';
import 'dart:io';
import 'package:r34_02/features/users/presentation/services/user_console_service.dart';

class UserMenu {
  final UserConsoleService _userConsoleService;
  Timer? _loadingTimer;

  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  UserMenu(this._userConsoleService) {
    // Listen to loading stream
    _loadingSub = _userConsoleService.loadingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _startLoadingAnimation();
      } else {
        _stopLoadingAnimation();
        print("\n✅ Done.\n");
      }
    });
  }

  Future<void> showMenu() async {
    while (true) {
      print("\n===== USER MANAGEMENT SYSTEM =====");
      print("1. List All Users");
      print("2. View User Details");
      print("3. Create New User");
      print("4. Update User");
      print("5. Delete User");
      print("6. Exit");
      print("Enter your choice (1-6)");

      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          await _userConsoleService.displayAllUsers();
          break;
        case '2':
          await _viewUserMenu();
          break;
        case '3':
          await _createUserMenu();
          break;
        case '4':
          await _updateUserMenu();
          break;
        case '5':
          await _deleteUserMenu();
          break;
        case '6':
          return;
        default:
          print("Invalid choice, please try again.");
      }
    }
  }

  Future<void> _viewUserMenu() async {
    print("\n===== USER DETAILS =====");
    print("Enter User ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userConsoleService.displayUser(id);
    }
  }

  Future<void> _createUserMenu() async {
    print("\n===== CREATE USER =====");
    print("Enter User Name:");
    final name = stdin.readLineSync();
    print("Enter User Email:");
    final email = stdin.readLineSync();
    print("Enter User Gender:");
    final gender = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        email != null &&
        email.isNotEmpty &&
        gender != null &&
        gender.isNotEmpty) {
      await _userConsoleService.createUser(name, email, gender);
    } else {
      print("⚠️ All fields are required, please try again.");
    }
  }

  Future<void> _updateUserMenu() async {
    print("\n===== UPDATE USER =====");
    print("Enter User ID:");
    final id = stdin.readLineSync();
    print("Enter new User Name:");
    final newName = stdin.readLineSync();
    print("Enter new User Email:");
    final newEmail = stdin.readLineSync();
    print("Enter new User Gender:");
    final newGender = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        newName != null &&
        newName.isNotEmpty &&
        newEmail != null &&
        newEmail.isNotEmpty &&
        newGender != null &&
        newGender.isNotEmpty) {
      await _userConsoleService.updateUser(id, newName, newEmail, newGender);
    } else {
      print("⚠️ All fields are required, please try again.");
    }
  }

  Future<void> _deleteUserMenu() async {
    print("\n===== DELETE USER =====");
    print("Enter User ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _userConsoleService.deleteUser(id);
    }
  }

  void dispose() {
    _loadingSub?.cancel();
    _userConsoleService.dispose();
  }

  // 🔹 Animated loader
  void _startLoadingAnimation() {
    int dotCount = 0;
    _loadingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      dotCount = (dotCount + 1) % 4; // cycle 0..3
      stdout.write("\r⏳ Loading${'.' * dotCount}   ");
    });
  }

  void _stopLoadingAnimation() {
    _loadingTimer?.cancel();
    _loadingTimer = null;
    stdout.write("\r                          \r"); // clear line
  }
}

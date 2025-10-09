import 'dart:async';

import 'package:r34_02/core/error/messages.dart';
import 'package:r34_02/features/users/domain/entities/user.dart';
import 'package:r34_02/features/users/domain/usecases/create_user.dart';
import 'package:r34_02/features/users/domain/usecases/delete_user.dart';
import 'package:r34_02/features/users/domain/usecases/get_all_user.dart';
import 'package:r34_02/features/users/domain/usecases/get_user.dart';
import 'package:r34_02/features/users/domain/usecases/update_user.dart';

class UserConsoleService with MapFailurMessages {
  final GetAllUser getAllUsersUseCase;
  final GetUser getUserUseCase;
  final CreateUser createUserUseCase;
  final UpdateUser updateUserUseCase;
  final DeleteUser deleteUserUseCase;

  UserConsoleService({
    required this.getAllUsersUseCase,
    required this.getUserUseCase,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  });

  // 🔹 Loading state stream
  final _loadingController = StreamController<bool>.broadcast();
  Stream<bool> get loadingStream => _loadingController.stream;

  void _setLoading(bool v) => _loadingController.add(v);

  Future<void> displayAllUsers() async {
    _setLoading(true);
    final result = await getAllUsersUseCase();
    _setLoading(false);

    result.fold((failure) => print("❌ Error: ${mapFailurToMssage(failure)}"), (
      users,
    ) {
      if (users.isEmpty) {
        print("⚠️ No users found.");
      } else {
        print("\n===== USERS =====");
        for (final user in users) {
          print("ID: ${user.id}");
          print("Username: ${user.name}"); // username field
          print("Email: ${user.email}");
          print("Gender: ${user.gender}");
          print("------");
        }
      }
    });
  }

  Future<void> displayUser(String id) async {
    _setLoading(true);
    final result = await getUserUseCase(GetUserParam(id: id));
    _setLoading(false);

    result.fold((failure) => print("❌ Error: ${mapFailurToMssage(failure)}"), (
      user,
    ) {
      print("ID: ${user.id}");
      print("Username: ${user.name}");
      print("Email: ${user.email}");
      print("Gender: ${user.gender}");
      print("------");
    });
  }

  Future<void> createUser(String username, String email, String gender) async {
    _setLoading(true);
    final user = User(id: "", name: username, email: email, gender: gender);
    final result = await createUserUseCase(CreateUserParam(user: user));
    _setLoading(false);

    result.fold((failure) => print("❌ Error: ${mapFailurToMssage(failure)}"), (
      newUser,
    ) {
      print("\n✅ User created successfully:\n");
      print("ID: ${newUser.id}");
      print("Username: ${newUser.name}");
      print("Email: ${newUser.email}");
      print("Gender: ${newUser.gender}");
    });
  }

  Future<void> updateUser(
    String id,
    String newUsername,
    String newEmail,
    String newGender,
  ) async {
    _setLoading(true);
    final user = User(
      id: id,
      name: newUsername,
      email: newEmail,
      gender: newGender,
    );
    final result = await updateUserUseCase(UpdateUserParam(user: user));
    _setLoading(false);

    result.fold((failure) => print("❌ Error: ${mapFailurToMssage(failure)}"), (
      updatedUser,
    ) {
      print("\n✅ User updated successfully:\n");
      print("ID: ${updatedUser.id}");
      print("Username: ${updatedUser.name}");
      print("Email: ${updatedUser.email}");
      print("Gender: ${updatedUser.gender}");
    });
  }

  Future<void> deleteUser(String id) async {
    _setLoading(true);
    final result = await deleteUserUseCase(DeleteUserParam(id: id));
    _setLoading(false);

    result.fold(
      (failure) => print("❌ Error: ${mapFailurToMssage(failure)}"),
      (success) => print(
        success
            ? "✅ User deleted successfully"
            : "⚠️ User with id $id not found",
      ),
    );
  }

  // 🔹 Close stream when done
  void dispose() {
    _loadingController.close();
  }
}

import 'package:r34_23/core/error/message.dart';
import 'package:r34_23/features/users/domain/entities/user.dart';
import 'package:r34_23/features/users/domain/usecases/create_user.dart';
import 'package:r34_23/features/users/domain/usecases/delete_user.dart';
import 'package:r34_23/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_23/features/users/domain/usecases/get_user.dart';
import 'package:r34_23/features/users/domain/usecases/update_user.dart';

class UserConsoleServices with Message {
  final GetAllUsers getAllUsersUseCase;
  final GetUser getUserUseCase;
  final CreateUser createUserUseCase;
  final UpdateUser updateUserUseCase;
  final DeleteUser deleteUserUseCase;

  UserConsoleServices({
    required this.getAllUsersUseCase,
    required this.getUserUseCase,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
  });

  void displayAllUsers() {
    final result = getAllUsersUseCase();
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (users) {
        if (users.isEmpty) {
          print("No users found.");
        } else {
          print('\n=== Users ===');
          for (final user in users) {
            print("ID: ${user.id}");
            print("Name: ${user.name}");
            print("Email: ${user.email}");
            print("-----");
          }
        }
      },
    );
  }

  void displayUser(String id) {
    final result = getUserUseCase(GetUserParams(id));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (user) {
        print("\n=== User Details ===");
        print("ID: ${user.id}");
        print("Name: ${user.name}");
        print("Email: ${user.email}");
      },
    );
  }

  void createUser(String name, String email) {
    final user = User(
      id: "",
      name: name,
      email: email,
    );

    final result = createUserUseCase(CreateUserParams(user));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (newUser) =>
          print("New user created successfully with ID: ${newUser.id}"),
    );
  }

  void updateUser(String id, String name, String email) {
    final user = User(
      id: id,
      name: name,
      email: email,
    );

    final result = updateUserUseCase(UpdateUserParams(user));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (updateuser) => print("User updated successfully."),
    );
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParams(id));
    result.fold(
      (failure) => print("Error: ${message(failure)}"),
      (success) => print( success ? "User deleted successfully." : "User not found.",),
    );
  }
}
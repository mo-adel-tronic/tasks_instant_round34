import 'package:r34_22/core/error/messages.dart';
import 'package:r34_22/features/user/domain/entities/user.dart';
import 'package:r34_22/features/user/domain/usecases/create_user.dart';
import 'package:r34_22/features/user/domain/usecases/delete_user.dart';
import 'package:r34_22/features/user/domain/usecases/get_all_user.dart';
import 'package:r34_22/features/user/domain/usecases/get_user.dart';
import 'package:r34_22/features/user/domain/usecases/update_user.dart';

class UserConsoleServices with MapFailureMessages {
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
      (failure) => print("Error: ${mapFailureToMessage(failure)}"),
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
      (failure) => print("Error: ${mapFailureToMessage(failure)}"),
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

    final result = createUserUseCase(CreateUserParams(User as User, User: null));
    result.fold(
      (failure) => print("Error: ${mapFailureToMessage(failure)}"),
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
      (failure) => print("Error: ${mapFailureToMessage(failure)}"),
      (updateuser) => print("User updated successfully."),
    );
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParams(id: id));
    result.fold(
      (failure) => print("Error: ${mapFailureToMessage(failure)}"),
      (success) => print( success ? "User deleted successfully." : "User not found.",),
    );
  }
}
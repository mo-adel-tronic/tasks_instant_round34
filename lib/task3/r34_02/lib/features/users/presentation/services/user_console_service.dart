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

  void displayAllUsers() {
    final result = getAllUsersUseCase();
    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      users,
    ) {
      if (users.isEmpty) {
        print("No users found.");
      } else {
        print("\n===== USERS ====");
        for (final user in users) {
          print("ID: ${user.id}");
          print("Name: ${user.name}");
          print("Email: ${user.email}");
          print("Gender: ${user.gender}");
          print("------");
        }
      }
    });
  }

  void displayUser(String id) {
    final result = getUserUseCase(GetUserParam(id: id));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      user,
    ) {
      print("ID: ${user.id}");
      print("Name: ${user.name}");
      print("Email: ${user.email}");
      print("Gender: ${user.gender}");
      print("------");
    });
  }

  void createUser(String name, String email, String gender) {
    final user = User(id: '', name: name, email: email, gender: gender);
    final result = createUserUseCase(CreateUserParam(user: user));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      newUser,
    ) {
      print("\nUser is created successfully with details :\n");
      print("ID: ${newUser.id}");
      print("Name: ${newUser.name}");
      print("Email: ${newUser.email}");
      print("Gender: ${newUser.gender}");
    });
  }

  void updateUser(
    String id,
    String newName,
    String newEmail,
    String newGender,
  ) {
    final user = User(
      id: id,
      name: newName,
      email: newEmail,
      gender: newGender,
    );
    final result = updateUserUseCase(UpdateUserParam(user: user));

    result.fold((failure) => print("Error is ${mapFailurToMssage(failure)}"), (
      updatedUser,
    ) {
      print("\nUser is updated successfully with details :\n");
      print("ID: ${updatedUser.id}");
      print("Name: ${updatedUser.name}");
      print("Email: ${updatedUser.email}");
      print("Gender: ${updatedUser.gender}");
    });
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParam(id: id));
    result.fold(
      (failure) => print("Error is ${mapFailurToMssage(failure)}"),
      (success) => print(
        success
            ? "User is deleted successfully"
            : "User with id $id was not found",
      ),
    );
  }
}

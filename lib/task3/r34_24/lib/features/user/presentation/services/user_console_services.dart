import 'package:r34_24/core/error/messages.dart';
import 'package:r34_24/features/user/domain/entites/user.dart';
import 'package:r34_24/features/user/domain/uesecases/create_user.dart';
import 'package:r34_24/features/user/domain/uesecases/delete_user.dart';
import 'package:r34_24/features/user/domain/uesecases/get_all_user.dart';
import 'package:r34_24/features/user/domain/uesecases/get_user.dart';
import 'package:r34_24/features/user/domain/uesecases/uptade_user.dart';

class UserConsoleService with MapFailureMessages {
  final GetAllUsers getAllUsersUseCase;
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
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (users) {
        if (users.isEmpty) {
          print('No users found.');
        } else {
          print("\n====== All Users ======");
          for (final user in users) {
            print('ID: ${user.id}');
            print('Name: ${user.name}');
            print('Email: ${user.email}');
            print('--------------------');
          }
        }
      },
    );
  }

  void displayUser(String id) {
    final result = getUserUseCase(GetUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (user) {
        print("\n====== User Details ======");
        print('ID: ${user.id}');
        print('Name: ${user.name}');
        print('Email: ${user.email}');
      },
    );
  }

  void createUser(String name, String email) {
    final user = User(id: '', name: name, email: email);
    final result = createUserUseCase(CreateUserParams(user: user));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (newUser) => print('User created successfully with ID: ${newUser.id}'),
    );
  }

  void updateUser(String id, String name, String email) {
    final user = User(id: id, name: name, email: email);
    final result = updateUserUseCase(UpdateUserParams(user: user));
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (_) => print('User updated successfully'),
    );
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(id);
    result.fold(
      (failure) => print('Error: ${MapFailureToMessages(failure)}'),
      (success) =>
          print(success ? 'User deleted successfully' : 'User not found'),
    );
  }
}

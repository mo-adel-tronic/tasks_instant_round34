import 'package:r34_16/core/error/messages.dart';
import 'package:r34_16/features/users/domain/entities/user.dart';
import 'package:r34_16/features/users/domain/usecases/create_user.dart';
import 'package:r34_16/features/users/domain/usecases/delete_user.dart';
import 'package:r34_16/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_16/features/users/domain/usecases/get_user.dart';
import 'package:r34_16/features/users/domain/usecases/update_user.dart';

class UserConsoleService with FailureMessages {
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
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (users) {
        if (users.isEmpty) {
          print('No users found.');
        } else {
          print('\n== USERS ===');
          for (final user in users) {
            print('ID: ${user.id}');
            print('Name: ${user.name}');
            print('Email: ${user.email}');
            print('--');
          }
        }
      },
    );
  }

  void displayUser(String id) {
    final result = getUserUseCase(GetUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (user) {
        print('\n== USER DETAILS ===');
        print('ID: ${user.id}');
        print('Name: ${user.name}');
        print('Email: ${user.email}');
      },
    );
  }

  void createUser(String name, String email) {
    final user = User(
      id: '',
      name: name,
      email: email,
    );

    final result = createUserUseCase(CreateUserParams(user: user));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newUser) => print('User created successfully with ID: ${newUser.id}'),
    );
  }

  void updateUser(String id, String name, String email) {
    final user = User(
      id: id,
      name: name,
      email: email,
    );

    final result = updateUserUseCase(UpdateUserParams(user: user));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedUser) => print('User updated successfully'),
    );
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(success ? 'User deleted successfully' : 'User not found'),
    );
  }
}
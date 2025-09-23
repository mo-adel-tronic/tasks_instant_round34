import 'package:task3/core/error/messages.dart';
import 'package:task3/features/user/domin/entities/user.dart';
import 'package:task3/features/user/domin/usecase/create_user.dart';
import 'package:task3/features/user/domin/usecase/delete_user.dart';
import 'package:task3/features/user/domin/usecase/get_all_user.dart';
import 'package:task3/features/user/domin/usecase/get_user.dart';
import 'package:task3/features/user/domin/usecase/update_user.dart';

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

  void displayAllUser () {
    final user = getAllUsersUseCase();
    user.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
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
  void displayUser (String id) {
    final result = getUserUseCase(GetUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
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

    final result = createUserUseCase(CreateUserParams(user));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newUser) => print('User created successfully with ID: ${newUser.id}'),
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
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (updatedUser) => print('User updated successfully'),
    );
  }
  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) => print(success ? 'User deleted successfully' : 'User not found'),
    );
  }
}

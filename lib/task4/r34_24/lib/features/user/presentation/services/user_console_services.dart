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

  Future<void> displayAllUsers() async {
    final result = await getAllUsersUseCase();
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
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

  Future<void> displayUser(String id) async {
    final result = await getUserUseCase(GetUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (user) {
        print("\n====== User Details ======");
        print('ID: ${user.id}');
        print('Name: ${user.name}');
        print('Email: ${user.email}');
      },
    );
  }

  Future<void> createUser(String name, String email) async {
    final user = User(id: '', name: name, email: email);
    final result = await createUserUseCase(CreateUserParams(user: user));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newUser) => print('User created successfully with ID: ${newUser.id}'),
    );
  }

  Future<void> updateUser(String id, String name, String email) async {
    final user = User(id: id, name: name, email: email);
    final result = await updateUserUseCase(UpdateUserParams(user: user));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (_) => print('User updated successfully'),
    );
  }

  Future<void> deleteUser(String id) async {
    final result = await deleteUserUseCase(DeleteUserParams(id: id));
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) => print(success ? 'User deleted successfully' : 'User not found'),
    );
  }
}
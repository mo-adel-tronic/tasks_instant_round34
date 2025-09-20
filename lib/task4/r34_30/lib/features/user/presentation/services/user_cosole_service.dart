import 'dart:async';

import 'package:r34_30/core/error/messages.dart';
import 'package:r34_30/features/user/domin/entities/user.dart';
import 'package:r34_30/features/user/domin/usecase/create_user.dart';
import 'package:r34_30/features/user/domin/usecase/delete_user.dart';
import 'package:r34_30/features/user/domin/usecase/get_all_user.dart';
import 'package:r34_30/features/user/domin/usecase/get_user.dart';
import 'package:r34_30/features/user/domin/usecase/update_user.dart';

class UserConsoleService with MapFailureMessages {
  final _loadingController = StreamController<bool>.broadcast();

  Stream<bool> get loadingStream => _loadingController.stream;

  void _setLoading(bool v) => _loadingController.add(v);

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

  void dispose() {
    _loadingController.close();
  }

  Future<void> displayAllUser() async {
    _setLoading(true);
    final user = await getAllUsersUseCase();
    _setLoading(false);
    user.fold((failure) => print('Error: ${mapFailureMessages(failure)}'), (
      users,
    ) {
      if (users.isEmpty) {
        print('No users found.');
      } else {
        print('\n== USERS ===');
        for (final user in users) {
          print('ID: ${user.id}');
          print('firstName: ${user.firstName}');
          print('Email: ${user.email}');
          print('--');
        }
      }
    });
  }

  Future<void> displayUser(String id) async {
    _setLoading(true);
    final result = await getUserUseCase(GetUserParams(id: id));
    _setLoading(false);
    result.fold((failure) => print('Error: ${mapFailureMessages(failure)}'), (
      user,
    ) {
      print('\n== USER DETAILS ===');
      print('ID: ${user.id}');
      print('firstName: ${user.firstName}');
      print('Email: ${user.email}');
    });
  }

  Future<void> createUser(String firstName, String email) async {
    final user = User(id: '', firstName: firstName, email: email);
    _setLoading(true);
    final result = await createUserUseCase(CreateUserParams(user));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (newUser) => print('User created successfully with ID: ${newUser.id}'),
    );
  }

  Future<void> updateUser(String id, String firstName, String email) async {
    final user = User(id: id, firstName: firstName, email: email);
    _setLoading(true);
    final result = await updateUserUseCase(UpdateUserParams(user));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (updatedUser) => print('User updated successfully'),
    );
  }

  Future<void> deleteUser(String id) async {
    _setLoading(true);
    final result = await deleteUserUseCase(DeleteUserParams(id: id));
    _setLoading(false);
    result.fold(
      (failure) => print('Error: ${mapFailureMessages(failure)}'),
      (success) =>
          print(success ? 'User deleted successfully' : 'User not found'),
    );
  }
}

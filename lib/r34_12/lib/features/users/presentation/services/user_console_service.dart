import 'dart:async';

import 'package:r34_12/core/error/messages.dart';
import 'package:r34_12/features/users/domain/entities/user.dart';
import 'package:r34_12/features/users/domain/usecases/create_user.dart';
import 'package:r34_12/features/users/domain/usecases/delete_user.dart';
import 'package:r34_12/features/users/domain/usecases/get_all_users.dart';
import 'package:r34_12/features/users/domain/usecases/get_user.dart';
import 'package:r34_12/features/users/domain/usecases/update_user.dart';




class UserConsoleService with FailureMessages {
  final _lodingController = StreamController<bool>.broadcast();


  Stream<bool> get lodingStream => _lodingController.stream;

  void _setLoding(bool v) => _lodingController.add(v);


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


  void dispose(){
    _lodingController.close();
  }

  Future<void> displayAllUsers() async {
    _setLoding(true);
    final result = await getAllUsersUseCase();
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (users) {
        if(users.isEmpty) {
          print('No users found.');
        } else {
          print('\n== UserS ===');
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

  Future<void> displayUser(String id) async {
     _setLoding(true);
    final result = await getUserUseCase(GetUserParams(id: id));
    _setLoding(false);
    
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (user) {
        print('\n== User DETAILS ===');
        print('ID: ${user.id}');
        print('Name: ${user.name}');
        print('Email: ${user.email}');
        
      },
    );
  }

  Future<void> createUser(String name, String email) async {
    final user = User(
      id: '',
      name: name,
      email: email,
      
    );

    _setLoding(true);
    final result = await createUserUseCase(CreateUserParams(user: user));
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (newUser) => print('User created successfully with ID: ${newUser.id}'),
    );
  }

  Future<void> updateUser(String id, String name, String email) async {
    final user = User(
      id: id,
      name: name,
      email: email,
      
    );


    _setLoding(true);
    final result = await updateUserUseCase(UpdateUserParams(user: user));
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (updatedUser) => print('User updated successfully'),
    );
  }

  Future<void> deleteUser(String id) async {
    _setLoding(true);
    final result = await deleteUserUseCase(DeleteUserParams(id: id));
    _setLoding(false);
    result.fold(
      (failure) => print('Error: ${mapFailureToMessage(failure)}'),
      (success) => print(success ? 'User deleted successfully' : 'User not found'),
    );
  }
}
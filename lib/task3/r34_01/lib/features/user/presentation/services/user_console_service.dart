import 'package:r34_01/features/user/domain/entity/user_entity.dart';
import 'package:r34_01/features/user/domain/usecase/create_user.dart';
import 'package:r34_01/features/user/domain/usecase/delete_user.dart';
import 'package:r34_01/features/user/domain/usecase/get_all_users.dart';
import 'package:r34_01/features/user/domain/usecase/get_user.dart';
import 'package:r34_01/features/user/domain/usecase/update_user.dart';
import 'package:r34_01/core/error/messages.dart';

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
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      users,
    ) {
      if (users.isEmpty) {
        print("No Users found.");
      } else {
        print("\n===USERS===");
        for (final user in users) {
          print("ID: ${user.id}");
          print("Name: ${user.name}");
          print("Description: ${user.description}");
          print("Price: \$${user.price.toStringAsFixed(2)}");
          print("-----");
        }
      }
    });
  }

  void displayUser(String id) {
    final result = getUserUseCase(GetUserParams(id: id));
    result.fold((failure) => print('Error: ${mapFailureToMessage(failure)}'), (
      user,
    ) {
      print("\n===USERS===");
      print("ID: ${user.id}");
      print("Name: ${user.name}");
      print("Description: ${user.description}");
      print("Price: \$${user.price.toStringAsFixed(2)}");
      print("-----");
    });
  }

  void createBook(String name, String description, double price) {
    final user = User(
      id: '',
      name: name,
      description: description,
      price: price,
    );
    final result = createUserUseCase(CreateUserParams(user: user));
    result.fold(
      (failuer) => print('Error:${mapFailureToMessage(failuer)}'),
      (newUser) => print('User created successfully with ID:${newUser.id}'),
    );
  }

  void updateBook(String id, String name, String description, double price) {
    final user = User(
      id: id,
      name: name,
      description: description,
      price: price,
    );
    final result = updateUserUseCase(UpdateUserParams(user: user));
    result.fold(
      (failure) => print('Error:${mapFailureToMessage(failure)}'),
      (updatedUser) => print('User updated successfully'),
    );
  }

  void deleteUser(String id) {
    final result = deleteUserUseCase(DeleteUserParams(id: id));
    result.fold(
      (failure) => print('Error:${mapFailureToMessage(failure)}'),
      (success) => print(success? 'User deleted successfully' : 'User not found'),
    );
  }

  void createUser(String name, String description, double price) {}

  void updateUser(String id, String name, String description, double price) {}
}

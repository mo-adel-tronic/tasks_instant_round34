import 'dart:io';

import 'package:r34_01/features/post/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postService;
  PostMenu(this._postService);
  void showMenu() {
   subLoop: while (true) {
      print('\n===POST MANGEMENT SYSTEM===');
      print('1. List all posts');
      print('2. View post deaols');
      print('3. Create new post');
      print('4. Update post');
      print('5. Delete post');
      print('6. Exit');
      print('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _postService.displayAllPosts();
          break;
        case '2':
          _viewPost();
          break;
        case '3':
          _createPost();
          break;
        case '4':
          _updatePost();
          break;
        case '5':
          _deletePost();
          break;
        case '6':
          print('Goodbye!');
          break subLoop;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewPost() {
    print('Enter post ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postService.displayPost(id);
    }
  }

  void _createPost() {
    print('Enter post name: ');
    final name = stdin.readLineSync();
    print('Enter post description: ');
    final description = stdin.readLineSync();
    print('Enter post price: ');
    final priceStr = stdin.readLineSync();

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _postService.createPost(name, description, price);
      } catch (e) {
        print('Invalid price formate. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _updatePost() {
    print('Enter post ID: ');
    final id = stdin.readLineSync();
    print('Enter post name: ');
    final name = stdin.readLineSync();
    print('Enter post description: ');
    final description = stdin.readLineSync();
    print('Enter post price: ');
    final priceStr = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        priceStr != null &&
        priceStr.isNotEmpty) {
      try {
        final price = double.parse(priceStr);
        _postService.updatePost(id, name, description, price);
      } catch (e) {
        print('Invalid price formate. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  void _deletePost() {
    print('Enter book ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postService.deletePost(id);
    }
  }
}

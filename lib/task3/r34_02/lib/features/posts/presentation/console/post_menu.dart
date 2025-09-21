import 'dart:io';

import 'package:r34_02/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postConsoleService;

  PostMenu(this._postConsoleService);
  void showMenu() {
    while (true) {
      print("\n===== POST MANAGEMENT SYSTEM =====");
      print("1.List All Posts");
      print("2.View Post Details");
      print("3.Create New Post");
      print("4.Update Post");
      print("5.Delete Post");
      print("6.Exit");
      print("Enter your choice (1-6)");

      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          _postConsoleService.displayAllPosts();
          break;
        case '2':
          _viewPostMenu();
          break;
        case '3':
          _createPostMenu();
          break;
        case '4':
          _updatePostMenu();
          break;
        case '5':
          _deletePostMenu();
          break;
        case '6':
          return; //to exit from this loop
        default:
          print("invalid choise, please try again");
      }
    }
  }

  void _viewPostMenu() {
    print("\n===== POST DETAILS =====");

    print("Enter Post ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postConsoleService.displayPost(id);
    }
  }

  void _createPostMenu() {
    print("\n===== CREATE POST =====");
    print("Enter Post Title:");
    final title = stdin.readLineSync();
    print("Enter Post Text:");
    final text = stdin.readLineSync();
    print("Enter Number of Likes:");
    final numOfLikesStr = stdin.readLineSync();
    if (title != null &&
        title.isNotEmpty &&
        text != null &&
        text.isNotEmpty &&
        numOfLikesStr != null &&
        numOfLikesStr.isNotEmpty) {
      try {
        final numOfLikes = int.parse(numOfLikesStr);
        _postConsoleService.createPost(title, text, numOfLikes);
      } catch (e) {
        print("Number of likes format is not valid");
      }
    } else {
      print("All Fields are required,please");
    }
  }

  void _updatePostMenu() {
    print("\n===== UPDATE POST =====");

    print("Enter Post ID:");
    final id = stdin.readLineSync();
    print("Enter new Post Title:");
    final newTitle = stdin.readLineSync();
    print("Enter new Post Text:");
    final newText = stdin.readLineSync();
    print("Enter new Number of Likes:");
    final newNumOfLikesStr = stdin.readLineSync();
    if (id != null &&
        id.isNotEmpty &&
        newTitle != null &&
        newTitle.isNotEmpty &&
        newText != null &&
        newText.isNotEmpty &&
        newNumOfLikesStr != null &&
        newNumOfLikesStr.isNotEmpty) {
      try {
        final newNumOfLikes = int.parse(newNumOfLikesStr);
        _postConsoleService.updatePost(id, newTitle, newText, newNumOfLikes);
      } catch (e) {
        print("Number of likes format is not valid");
      }
    } else {
      print("All Fields are required,please");
    }
  }

  void _deletePostMenu() {
    print("\n===== DELETE POST =====");

    print("Enter Post ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postConsoleService.deletePost(id);
    }
  }
}

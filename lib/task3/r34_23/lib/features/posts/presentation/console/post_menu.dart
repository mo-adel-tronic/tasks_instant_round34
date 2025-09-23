import 'dart:io';
import 'package:r34_23/features/posts/presentation/services/post_console_services.dart';

class PostMenu {
  final PostConsoleServices _postServices;

  PostMenu(this._postServices);

  void showMenu() {
    subloop:while (true) {
      print("\n=== Post Management System ===");
      print("1. List all posts");
      print("2. View post details");
      print("3. Create new post");
      print("4. Update post");
      print("5. Delete post");
      print("6. Exit");
      print("Enter your choice (1-6): ");

      final choice = stdin.readLineSync();
      switch (choice) {
        case "1":
          _postServices.displayAllPosts();
          break;
        case "2":
          _viewPost();
          break;
        case "3":
          _createPost();
          break;
        case "4":
          _updatePost();
          break;
        case "5":
          _deletePost();
          break;
        case "6":
          print("Goodbye");
          break subloop;
        default:
          print("Invalid choice, please try again.");
      }
    }
  }

  void _viewPost() {
    print("Enter post ID: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postServices.displayPost(id);
    }
  }

  void _createPost() {
    print("Enter post title: ");
    final title = stdin.readLineSync();
    print("Enter post content: ");
    final content = stdin.readLineSync();

    if (title != null &&
        title.isNotEmpty &&
        content != null &&
        content.isNotEmpty) {
      _postServices.createPost(title, content);
    } else {
      print("All fields are required.");
    }
  }

  void _updatePost() {
    print("Enter the ID of the post to update: ");
    final id = stdin.readLineSync();
    print("Enter new post title: ");
    final title = stdin.readLineSync();
    print("Enter new post content: ");
    final content = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        title != null &&
        title.isNotEmpty &&
        content != null &&
        content.isNotEmpty) {
      _postServices.updatePost(id, title, content);
    } else {
      print("All fields are required.");
    }
  }

  void _deletePost() {
    print("Enter post ID to delete: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postServices.deletePost(id);
    }
  }
}
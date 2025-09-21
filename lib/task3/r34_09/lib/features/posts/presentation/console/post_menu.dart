import 'dart:io';

import 'package:task7/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postservice;
  PostMenu(this._postservice);

  Future<void> showMenu() async {
    while (true) {
      print("\n=== user Management System ===");
      print("1. List all posts");
      print("2. View post details");
      print("3. Create new post");
      print("4. Update post");
      print("5. Delete post");
      print("6.main menu");
      print("7. Exit");
      stdout.write("Enter your choice (1-7): ");
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await _postservice.displayAllPost();
          break;
        case '2':
          await _viewpost();
          break;
        case '3':
          await _createpost();
          break;
        case '4':
          await _updatepost();
          break;
        case '5':
          await _deletepost();
          break;
             case '6':
           return;
          
        case '7':
          print("Exiting...");
          exit(0);
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }
 
  Future<void> _viewpost() async {
    stdout.write("Enter user Id: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postservice.displaypost(id);
    } else {
      print("Id is required.");
    }
  }

  Future<void> _createpost() async {
    stdout.write("Enter post title: ");
    final title = stdin.readLineSync();
    stdout.write("Enter post content: ");
    final content = stdin.readLineSync();
    stdout.write("Enter post date: ");
    final createAt = stdin.readLineSync();

    if (title != null &&
        title.isNotEmpty &&
        content != null &&
        content.isNotEmpty &&
        createAt != null &&
        createAt.isNotEmpty) {
      try {
        final createat = int.parse(createAt);
        await _postservice.createpost(title, content, createat);
      } catch (e) {
        print("Invalid date format. Please enter a valid number.");
      }
    } else {
      print("All fields are required.");
    }
  }

  Future<void> _updatepost() async {
    stdout.write("Enter user Id to post: ");
    final id = stdin.readLineSync();
   stdout.write("Enter post title: ");
    final title = stdin.readLineSync();
    stdout.write("Enter post content: ");
    final content = stdin.readLineSync();
    stdout.write("Enter post date: ");
    final createAt = stdin.readLineSync();
    if (id != null &&
        id.isNotEmpty &&
      title != null &&
        title.isNotEmpty &&
        content != null &&
        content.isNotEmpty &&
        createAt != null &&
        createAt.isNotEmpty) {
      try {
        final createat = int.parse(createAt);
        await _postservice.updatepost(id, title, content, createat);
      } catch (e) {
        print("Invalid date format. Please enter a valid number.");
      }
    } else {
      print("All fields are required.");
    }
  }

  Future<void> _deletepost() async {
    stdout.write("Enter user Id to delete: ");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postservice.deletepost(id);
    } else {
      print("Id is required.");
    }
  }
}

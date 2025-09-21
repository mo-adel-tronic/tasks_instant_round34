 import 'dart:io';
import 'package:task3/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postService;

  PostMenu(this._postService);

  void showMenu () {
    subLoop: while (true) {
      print("\n== POST MANAGEMENT SYSTEM ==");
      print('1. List all posts');
      print('2. View post details');
      print('3. Create new post');
      print('4. Update post');
      print('5. Delete post');
      print('6. Back to main menu');
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
          print('Returning to main menu...');
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
    } else {
      print('Post ID is required.');
    }
  }
   void _createPost() {
    print('Enter post name: ');
    final name = stdin.readLineSync();
    print('Enter post body: ');
    final body = stdin.readLineSync();

    if (name != null && name.isNotEmpty && body != null && body.isNotEmpty) {
      _postService.createPost(name, body);
    } else {
      print('All fields are required.');
    }
  }

  void _updatePost() {
    print('Enter post ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new post name: ');
    final name = stdin.readLineSync();
    print('Enter new post body: ');
    final body = stdin.readLineSync();

    if (id != null && id.isNotEmpty &&
        name != null && name.isNotEmpty &&
        body != null && body.isNotEmpty) {
      _postService.updatePost(id, name, body);
    } else {
      print('All fields are required.');
    }
  }

  void _deletePost() {
    print('Enter post ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postService.deletePost(id);
    } else {
      print('Post ID is required.');
    }
  }

}

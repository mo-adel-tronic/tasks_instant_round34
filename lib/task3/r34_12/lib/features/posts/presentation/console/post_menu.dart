import 'dart:io';
import 'package:r34_12/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postService;

  PostMenu(this._postService);

  void showMenu() {
    subLoop: while (true) {
      print("\n== Post MANAGEMENT SYSTEM ==");
      print('1. List all posts');
      print('2. View post details');
      print('3. Create new post');
      print('4. Update post');
      print('5. Delete post');
      print('6. Back to main menu');
      stdout.write('Enter your choice (1-6): ');

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
    stdout.write('Enter post ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postService.displayPost(id);
    } else {
      print('⚠️ Post ID is required.');
    }
  }

  void _createPost() {
    stdout.write('Enter post title: ');
    final title = stdin.readLineSync();
    stdout.write('Enter post content: ');
    final content = stdin.readLineSync();

    if (title != null && title.isNotEmpty &&
        content != null && content.isNotEmpty) {
      _postService.createPost(title, content);
    } else {
      print('⚠️ All fields are required.');
    }
  }

  void _updatePost() {
    stdout.write('Enter post ID to update: ');
    final id = stdin.readLineSync();
    stdout.write('Enter new post title: ');
    final title = stdin.readLineSync();
    stdout.write('Enter new post content: ');
    final content = stdin.readLineSync();

    if (id != null && id.isNotEmpty &&
        title != null && title.isNotEmpty &&
        content != null && content.isNotEmpty) {
      _postService.updatePost(id, title, content);
    } else {
      print('⚠️ All fields are required.');
    }
  }

  void _deletePost() {
    stdout.write('Enter post ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      _postService.deletePost(id);
    } else {
      print('⚠️ Post ID is required.');
    }
  }
}

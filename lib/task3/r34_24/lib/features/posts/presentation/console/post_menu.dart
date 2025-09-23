import 'dart:io';
import 'package:r34_24/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postConsoleService;
  PostMenu(this._postConsoleService);

  void showMenu() {
    while (true) {
      print('\n------ Post Management Menu ------');
      print('1. List all posts');
      print('2. View post details');
      print('3. Create new post');
      print('4. Update post');
      print('5. Delete post');
      print('6. Exit');
      stdout.write('Enter your choice (1-6): ');

      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _postConsoleService.displayAllPosts();
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
          print('Exiting Post Menu...');
          return;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  void _viewPost() {
    stdout.write('Enter Post ID: ');
    final id = stdin.readLineSync() ?? '';
    _postConsoleService.displayPost(id);
  }

  void _createPost() {
    stdout.write('Enter Post Title: ');
    final title = stdin.readLineSync() ?? '';

    stdout.write('Enter Post Content: ');
    final content = stdin.readLineSync() ?? '';

    stdout.write('Enter Publisher name : ');
    final publisherId = stdin.readLineSync() ?? '';

    _postConsoleService.createPost(title, content, publisherId);
  }

  void _updatePost() {
    stdout.write('Enter Post ID: ');
    final id = stdin.readLineSync() ?? '';

    stdout.write('Enter Updated Title: ');
    final title = stdin.readLineSync() ?? '';

    stdout.write('Enter Updated Content: ');
    final content = stdin.readLineSync() ?? '';

    stdout.write('Enter Updated publisher name : ');
    final publisherId = stdin.readLineSync() ?? '';

    _postConsoleService.updatePost(id, title, content, publisherId);
  }

  void _deletePost() {
    stdout.write('Enter Post ID: ');
    final id = stdin.readLineSync() ?? '';
    _postConsoleService.deletePost(id);
  }
}

import 'dart:io';
import 'package:r34_24/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postConsoleService;
  PostMenu(this._postConsoleService);

  Future<void> showMenu() async {
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
          await _postConsoleService.displayAllPosts();
          break;
        case '2':
          await _viewPost();
          break;
        case '3':
          await _createPost();
          break;
        case '4':
          await _updatePost();
          break;
        case '5':
          await _deletePost();
          break;
        case '6':
          print('Exiting Post Menu...');
          return;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  Future<void> _viewPost() async {
    stdout.write('Enter Post ID: ');
    final id = stdin.readLineSync() ?? '';
    if (id.isEmpty) {
      print('Error: Post ID cannot be empty.');
      return;
    }
    await _postConsoleService.displayPost(id);
  }

  Future<void> _createPost() async {
    stdout.write('Enter Post Title: ');
    final title = stdin.readLineSync() ?? '';
    stdout.write('Enter Post Content: ');
    final content = stdin.readLineSync() ?? '';
    stdout.write('Enter Publisher ID: ');
    final publisherId = stdin.readLineSync() ?? '';
    await _postConsoleService.createPost(title, content, publisherId);
  }

  Future<void> _updatePost() async {
    stdout.write('Enter Post ID: ');
    final id = stdin.readLineSync() ?? '';
    stdout.write('Enter Updated Title: ');
    final title = stdin.readLineSync() ?? '';
    stdout.write('Enter Updated Content: ');
    final content = stdin.readLineSync() ?? '';
    stdout.write('Enter Updated Publisher ID: ');
    final publisherId = stdin.readLineSync() ?? '';
    await _postConsoleService.updatePost(id, title, content, publisherId);
  }

  Future<void> _deletePost() async {
    stdout.write('Enter Post ID: ');
    final id = stdin.readLineSync() ?? '';
    await _postConsoleService.deletePost(id);
  }
}
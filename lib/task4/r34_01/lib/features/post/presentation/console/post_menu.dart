import 'dart:async';
import 'dart:io';

import 'package:r34_01/features/post/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postService;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  PostMenu(this._postService) {
    _loadingSub = _postService.loadingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _showSpinnerWhileLoading();
      }
    });
  }
        
  Future<void> showMenu()async {
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
          print('Returning to main menu...');
          break subLoop;
        default:
          print('Invalid choice. Please try again.');
      }
    }
  }

  Future<void> _viewPost() async {
    print('Enter post ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postService.displayPost(id);
    } else {
      print('Post ID is required.');
    }
  }

  Future<void> _createPost() async {
    print('Enter post name: ');
    final name = stdin.readLineSync();
    print('Enter post body: ');
    final body = stdin.readLineSync();

    if (name != null && name.isNotEmpty && body != null && body.isNotEmpty) {
      await _postService.createPost(name, body);
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _updatePost() async {
    print('Enter post ID to update: ');
    final id = stdin.readLineSync();
    print('Enter new post name: ');
    final name = stdin.readLineSync();
    print('Enter new post body: ');
    final body = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        body != null &&
        body.isNotEmpty) {
      await _postService.updatePost(id, name, body);
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _deletePost() async {
    print('Enter post ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postService.deletePost(id);
    } else {
      print('Post ID is required.');
    }
  }

    Future<void> _showSpinnerWhileLoading() async {
    const spinnerChars = ['|', '/', '-', '\\'];
    var i = 0;
    while (_isLoading) {
      print('Loading...');
      stdout.write('\rLoading... ${spinnerChars[i % spinnerChars.length]}');
      await Future.delayed(const Duration(milliseconds: 150));
      i++;
    }
    stdout.write('\r');
  }

  void dispose() {
    _loadingSub?.cancel();
    _postService.dispose();
  }
}

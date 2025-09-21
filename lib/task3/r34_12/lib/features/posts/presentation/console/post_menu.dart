import 'dart:io';
import 'dart:async';
import 'package:r34_12/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postService;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  PostMenu(this._postService) {
    _loadingSub = _postService.lodingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _showSpinnerWhileLoading();
      }
    });
  }

  Future<void> showMenu() async {
    menuLoop: while (true) {
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
          await _postService.displayAllPosts();
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
          print('Returning to main menu...');
          break menuLoop; 
        default:
          print('Invalid choice. Please try again.');
      }
    }

    await _loadingSub?.cancel(); 
  }

  Future<void> _viewPost() async {
    stdout.write('Enter post ID: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postService.displayPost(id);
    } else {
      print('Post ID is required.');
    }
  }

  Future<void> _createPost() async {
    stdout.write('Enter post Title: ');
    final title = stdin.readLineSync();
    stdout.write('Enter post content: ');
    final content = stdin.readLineSync();
    

    if (title != null &&
        title.isNotEmpty &&
        content != null &&
        content.isNotEmpty 
        ) {
      try {
        
        await _postService.createPost(title, content);
      } catch (e) {
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _updatePost() async {
    stdout.write('Enter post ID to update: ');
    final id = stdin.readLineSync();
    stdout.write('Enter new post title: ');
    final title = stdin.readLineSync();
    stdout.write('Enter new post content: ');
    final content = stdin.readLineSync();
    

    if (id != null &&
        id.isNotEmpty &&
        title != null &&
        title.isNotEmpty &&
        content != null &&
        content.isNotEmpty 
        ) {
      try {
        
        await _postService.updatePost(id, title, content);
      } catch (e) {
        print('Invalid price format. Please enter a valid number.');
      }
    } else {
      print('All fields are required.');
    }
  }

  Future<void> _deletePost() async {
    stdout.write('Enter post ID to delete: ');
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postService.deletePost(id);
    } else {
      print('Post ID is required.');
    }
  }

  void _showSpinnerWhileLoading() {
    
    print("Loading... Please wait.");
  }
}

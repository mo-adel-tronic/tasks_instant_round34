import 'dart:async';
import 'dart:io';
import 'package:r34_02/features/posts/presentation/services/post_console_service.dart';

class PostMenu {
  final PostConsoleService _postConsoleService;
  Timer? _loadingTimer;
  StreamSubscription<bool>? _loadingSub;
  bool _isLoading = false;

  PostMenu(this._postConsoleService) {
    // Listen to loading stream
    _loadingSub = _postConsoleService.loadingStream.listen((loading) {
      _isLoading = loading;
      if (loading) {
        _startLoadingAnimation();
      } else {
        _stopLoadingAnimation();
        print("\n✅ Done.\n");
      }
    });
  }

  Future<void> showMenu() async {
    while (true) {
      print("\n===== POST MANAGEMENT SYSTEM =====");
      print("1. List All Posts");
      print("2. View Post Details");
      print("3. Create New Post");
      print("4. Update Post");
      print("5. Delete Post");
      print("6. Exit");
      print("Enter your choice (1-6)");

      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          await _postConsoleService.displayAllPosts();
          break;
        case '2':
          await _viewPostMenu();
          break;
        case '3':
          await _createPostMenu();
          break;
        case '4':
          await _updatePostMenu();
          break;
        case '5':
          await _deletePostMenu();
          break;
        case '6':
          return;
        default:
          print("Invalid choice, please try again.");
      }
    }
  }

  Future<void> _viewPostMenu() async {
    print("\n===== POST DETAILS =====");
    print("Enter Post ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postConsoleService.displayPost(id);
    }
  }

  Future<void> _createPostMenu() async {
    print("\n===== CREATE POST =====");
    print("Enter Post Title:");
    final title = stdin.readLineSync();
    print("Enter Post Body:");
    final body = stdin.readLineSync();
    // print("Enter Post Views (number):");
    // final viewsStr = stdin.readLineSync();
    print("Enter Tags (comma separated):");
    final tagsStr = stdin.readLineSync();
    print("Enter User ID (number):");
    final userIdStr = stdin.readLineSync();

    if (title != null &&
        title.isNotEmpty &&
        body != null &&
        body.isNotEmpty &&
        userIdStr != null &&
        userIdStr.isNotEmpty) {
      try {
        final views = int.parse("0");
        final userId = int.parse(userIdStr);
        List<String> tags = tagsStr != null && tagsStr.isNotEmpty
            ? tagsStr.split(',')
            : [];

        await _postConsoleService.createPost(title, body, views, tags, userId);
      } catch (e) {
        print("❌ Views and User ID must be numbers.");
      }
    } else {
      print("⚠️ All fields are required, please try again.");
    }
  }

  Future<void> _updatePostMenu() async {
    print("\n===== UPDATE POST =====");
    print("Enter Post ID:");
    final id = stdin.readLineSync();
    print("Enter New Post Title:");
    final title = stdin.readLineSync();
    print("Enter New Post Body:");
    final body = stdin.readLineSync();
    // print("Enter New Post Views (number):");
    // final viewsStr = stdin.readLineSync();
    print("Enter New Tags (comma separated):");
    final tagsStr = stdin.readLineSync();
    print("Enter New User ID (number):");
    final userIdStr = stdin.readLineSync();

    if (id != null &&
        id.isNotEmpty &&
        title != null &&
        title.isNotEmpty &&
        body != null &&
        body.isNotEmpty &&
        userIdStr != null &&
        userIdStr.isNotEmpty) {
      try {
        final views = int.parse("0");
        final userId = int.parse(userIdStr);
        List<String> tags = tagsStr != null && tagsStr.isNotEmpty
            ? tagsStr.split(',')
            : [];

        await _postConsoleService.updatePost(
          id,
          title,
          body,
          views,
          tags,
          userId,
        );
      } catch (e) {
        print("❌ Views and User ID must be numbers.");
      }
    } else {
      print("⚠️ All fields are required, please try again.");
    }
  }

  Future<void> _deletePostMenu() async {
    print("\n===== DELETE POST =====");
    print("Enter Post ID:");
    final id = stdin.readLineSync();
    if (id != null && id.isNotEmpty) {
      await _postConsoleService.deletePost(id);
    }
  }

  // 🔹 Spinner animation
  void _startLoadingAnimation() {
    int dotCount = 0;
    _loadingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      dotCount = (dotCount + 1) % 4; // cycle 0..3
      stdout.write("\r⏳ Loading${'.' * dotCount}   ");
    });
  }

  void _stopLoadingAnimation() {
    _loadingTimer?.cancel();
    _loadingTimer = null;
    stdout.write("\r                          \r"); // clear line
  }

  void dispose() {
    _loadingSub?.cancel();
    _postConsoleService.dispose();
  }
}

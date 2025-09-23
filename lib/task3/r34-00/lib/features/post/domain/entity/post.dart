class Post {
  final int? id;
  final String title;
  final String body;
  final List<String> tags;
  final int views;
  final int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.views,
    required this.userId,
  });

}

class Post {
  final int? id;
  final String title;
  final String body;
  final List<String> tags;
  final int views;
  final int userId;

  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.views,
    required this.userId,
  });

  // Post.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   body = json['body'];
  //   tags = json['tags'].cast<String>();
  //   views = json['views'];
  //   userId = json['userId'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   data['tags'] = this.tags;
  //   data['views'] = this.views;
  //   data['userId'] = this.userId;
  //   return data;
  // }

  @override
  String toString() {
    return "Post(id: $id, title: $title, body: $body, tags: $tags, views: $views, userId: $userId)";
  }
}

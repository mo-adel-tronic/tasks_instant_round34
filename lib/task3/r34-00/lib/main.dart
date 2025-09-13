import 'package:r34_00/features/post/data/repository/post_implemnt_data.dart';
import 'package:r34_00/features/post/data/source/post_data_source.dart';
import 'package:r34_00/features/post/domain/entity/post.dart';

void main() {
  PostDataSource pds = PostDataSource();
  PostImplemntData pid = PostImplemntData(pds: pds);
  pid.addPost(
    post: Post(
      id: 31,
      title: "hello world",
      body: "Body",
      tags: ["#new"],
      views: 0,
      userId: -1,
    ),
  );
  // List<Post> posts = pds.getAllPosts();
  pid
      .getPost(id: 31, userId: -1)
      .fold(
        ifLeft: (failure) {
          print(failure.mapFailureMessage(failure));
        },
        ifRight: (post) {
          print(post);
        },
      );
}

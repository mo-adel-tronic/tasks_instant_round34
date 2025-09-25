import 'package:r34_01/core/constants/url.dart';
import 'package:r34_01/core/error/exceptions.dart';
import 'package:r34_01/core/network/api_provider.dart';
import 'package:r34_01/features/post/data/model/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPost(String id);
  Future<PostModel> createPost(PostModel post);
  Future<PostModel> updatePost(PostModel post);
  Future<bool> deletePost(String id);
}

class PostsRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiProvider apiProvider;
  static const _baseUrl = UrlConstants.baseUrl + UrlConstants.postsEndPoint;

  PostsRemoteDataSourceImpl({required this.apiProvider});

  @override
    Future<List<PostModel>> getAllPosts() async {
    try {
      final json = await apiProvider.get('$_baseUrl?limit=30');
      final List postsJson = json['posts'] as List;
      return postsJson
          .map((p) => PostModel.fromJson(p as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPost(String id) async {
    try {
      final json = await apiProvider.get('$_baseUrl/$id');
      return PostModel.fromJson(json as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> createPost(PostModel post) async {
    try {
      final body = post.toJsonForCreate();
      final json = await apiProvider.post('$_baseUrl/add', body: body);
      return PostModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> updatePost(PostModel post) async {
    try {
      final body = post.toJson();
      final json = await apiProvider.put('$_baseUrl/${post.id}', body: body);
      return PostModel.fromJson(json as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deletePost(String id) async {
    try {
      await apiProvider.delete('$_baseUrl/$id');
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
  

  

}
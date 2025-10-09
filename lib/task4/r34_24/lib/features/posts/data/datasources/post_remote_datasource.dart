import 'package:r34_24/core/error/exception.dart';
import 'package:r34_24/core/network/api_provider.dart';
import 'package:r34_24/features/posts/data/models/post_model.dart';

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPost(String id);
  Future<PostModel> createPost(PostModel post);
  Future<PostModel> updatePost(PostModel post);
  Future<bool> deletePost(String id);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final ApiProvider apiProvider;
  static const _baseurl = 'https://dummyjson.com/posts';

  PostRemoteDatasourceImpl({required this.apiProvider});

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final json = await apiProvider.get('$_baseurl?limit=30');
      final List postsJson = json['posts'] as List;
      return postsJson.map((p) => PostModel.fromJson(p as Map<String, dynamic>)).toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPost(String id) async {
    try {
      final json = await apiProvider.get('$_baseurl/$id');
      return PostModel.fromJson(json as Map<String, dynamic>);
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on NotFoundException {
      throw NotFoundException();
    } catch (e) {
      print('Error in getPost: $e');
      throw ServerException();
    }
  }

  @override
  Future<PostModel> createPost(PostModel post) async {
    try {
      final body = post.toJsonForCreate();
      final json = await apiProvider.post(_baseurl, body: body);
      return PostModel.fromJson(json as Map<String, dynamic>);
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
      final json = await apiProvider.put('$_baseurl/${post.id}', body: body);
      return PostModel.fromJson(json as Map<String, dynamic>);
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on NotFoundException {
      throw NotFoundException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deletePost(String id) async {
    try {
      await apiProvider.delete('$_baseurl/$id');
      return true;
    } on NotFoundException {
      return false;
    } on BadRequestException {
      throw BadRequestException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}

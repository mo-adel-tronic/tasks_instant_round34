import 'package:r34_02/core/constants/url_constants.dart';
import 'package:r34_02/core/error/exceptions.dart';
import 'package:r34_02/core/network/api_provider.dart';
import 'package:r34_02/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<PostModel> getPost(String id);
  Future<PostModel> createPost(PostModel model);
  Future<PostModel> updatePost(PostModel model);
  Future<bool> deletePost(String id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final APIProvider apiProvider;
  PostRemoteDataSourceImpl({required this.apiProvider});

  static const String _baseUrl =
      "${URLConstants.baseURL}${URLConstants.postsEndPoint}";

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final data = await apiProvider.get(_baseUrl);
      final List postsJson = data["posts"] as List;
      return postsJson
          .map((json) => PostModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPost(String id) async {
    try {
      final data = await apiProvider.get("$_baseUrl/$id");
      return PostModel.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> createPost(PostModel model) async {
    try {
      final data = await apiProvider.post(
        "$_baseUrl/add",
        body: model.toJsonCreate(), // ✅ Only send title, body, tags, userId
      );
      return PostModel.fromJson(data as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> updatePost(PostModel model) async {
    try {
      final data = await apiProvider.put(
        "$_baseUrl/${model.id}",
        body: model.toJson(), // ✅ Only send title, body, tags
      );
      return PostModel.fromJson(data as Map<String, dynamic>);
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deletePost(String id) async {
    try {
      await apiProvider.delete("$_baseUrl/$id");
      return true;
    } on NotFoundException {
      throw NotFoundException();
    } on BadRequestException {
      throw BadRequestException();
    } on UnAuthorizedException {
      throw UnAuthorizedException();
    } catch (e) {
      throw ServerException();
    }
  }
}

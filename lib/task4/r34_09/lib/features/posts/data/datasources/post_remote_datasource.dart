import 'dart:convert';
import 'package:task7/core/error/exceptions.dart';
import 'package:task7/core/network/api_provider.dart';
import 'package:task7/core/constants/url.dart';
import 'package:task7/features/posts/data/models/post_model.dart';

abstract class PostRemoteDatasource {
  Future<List<PostModel>> getAllPost();
  Future<PostModel> getPost(String id);
  Future<PostModel> createPost(PostModel post);
  Future<PostModel> updatePost(PostModel post);
  Future<bool> deletePost(String id);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource {
  final ApiProvider apiProvider;
  static const _baseUrl = URLconstants.baseURL + URLconstants.postsEndpoint;

  PostRemoteDatasourceImpl({required this.apiProvider});

  @override
  Future<List<PostModel>> getAllPost() async {
    try {
      final response = await apiProvider.get('$_baseUrl?limit=100');
      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;
      final List postsJson = data['posts'] as List;
      return postsJson
          .map((p) => PostModel.fromJson(p as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error in getAllPost: $e");
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPost(String id) async {
    try {
      final response = await apiProvider.get('$_baseUrl/$id');
      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;
      return PostModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> createPost(PostModel post) async {
    try {
       final body = post.toJsonForCreate();

      final response = await apiProvider.post(
        '$_baseUrl/add',
        body: body,
      );

      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;

      return PostModel.fromJson(data);
    } catch (e) {
      print("Create Post Error: $e");
      throw ServerException();
    }
  }




  @override
  Future<PostModel> updatePost(PostModel post) async {
    try {
      final response =
          await apiProvider.put("$_baseUrl/${post.id}", body: post.toJson());
      final Map<String, dynamic> data =
          response is String ? jsonDecode(response) : response;
      return PostModel.fromJson(data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<bool> deletePost(String id) async {
    try {
      await apiProvider.delete("$_baseUrl/$id");
      return true;
    } catch (e) {
      throw ServerException();
    }
  }
}

import 'dart:developer';

import 'package:actors_gallery/constants/strings.dart';
import 'package:dio/dio.dart';

class ActorWebservices {
  late Dio dio;

  ActorWebservices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      queryParameters: {'api_key': '2dfe23358236069710a379edd4c65a6b'},
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('person/popular');
      return response.data['results'];
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }

  Future<Map<String, dynamic>> getAllDetails(int id) async {
    try {
      Response response = await dio.get('person/$id?');
      return response.data;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {};
    }
  }

  Future<Map<String, dynamic>> getAllImages(int id) async {
    try {
      Response response = await dio.get('person/$id/images?');
      log(response.data.toString());
      return response.data['profiles'];
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {};
    }
  }
}

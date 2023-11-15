import 'dart:developer';

import 'package:http/http.dart';
import 'package:state_managment/model/post_model.dart';
import 'package:state_managment/model/user_model.dart';
import 'package:state_managment/utils/app_url.dart';

class ApiServices {
  static final Client _client = Client();

  static Future<List<PostModel>?> getPosts() async {
    try {
      final Response response =
          await _client.get(Uri.parse(AppUrls.baseURL + AppUrls.post));
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      log("error from getPosts ${e.toString()}");
    }
    return null;
  }
}

//api services of usermodel

class UserApiservices {
  static Client client = Client();

  static Future<List<UserModel>?> getUsers() async {
    try {
      final Response response =
          await client.get(Uri.parse(AppUrls.baseURL + AppUrls.names));
      if (response.statusCode == 200) {
        log("status code:${response.statusCode}");
        return userModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      log('error:$e');
    }
    return null;
  }
}

import 'dart:convert';

import 'package:PruebaCeiba/app/app_constants.dart';

import 'package:http/http.dart' as http;


class API {
  API();

  static const BASEAPIURL = 'jsonplaceholder.typicode.com';

  String uidUser = "";


  static const String GET_USERS = '/users';
  static const String GET_POSTS = '/posts';
  static const String GET_POSTSUSERID = '/posts?userdId=';

  Future<MyHttpResponse> getUser() async {
    var url = Uri.parse("http://"+BASEAPIURL+ GET_USERS);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
   try {
     if (response.statusCode == 200) {
       response.message = "exito";

     } else {
       response.message = "Error";
       response.data = null;
     }
   }catch(e){
     response.message = e.toString();
     response.data = null;
   }
    return response;
  }

  Future<MyHttpResponse> getPosts() async {
    var url = Uri.parse("http://"+BASEAPIURL+ GET_POSTS);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
    try {
      if (response.statusCode == 200) {
        response.message = "exito";
      } else {
        response.message = "Error";
        response.data = null;
      }
    }catch(e){
      response.message = e.toString();
      response.data = null;
    }
    return response;
  }
  Future<MyHttpResponse> getPostsUser(String value) async {
    var url = Uri.parse("http://"+BASEAPIURL+ GET_POSTSUSERID+value.toString());
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
    try {
      if (response.statusCode == 200) {
        response.message = "exito";
      } else {
        response.message = "Error";
        response.data = null;
      }
    }catch(e){
      response.message = e.toString();
      response.data = null;
    }
    return response;
  }








}

Future<MyHttpResponse> getRequest(Uri uri) async {
  var response = await http.get(uri);

  print(response.body);

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, response.body);
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}

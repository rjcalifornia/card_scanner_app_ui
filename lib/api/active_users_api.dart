import 'dart:async';
import 'package:http/http.dart' as http;

const api_v1 = "https://jsonplaceholder.typicode.com";

class UsersList {
  static Future getActiveUsers() {
    var urlUsrList = api_v1 + "/users";
    return http.get(urlUsrList);
  }
}
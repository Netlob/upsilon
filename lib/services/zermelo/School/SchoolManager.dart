import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zeta/services/zermelo/Manager.dart';
import 'package:zeta/services/zermelo/School/School.dart';
import 'package:zeta/services/zermelo/Util.dart';

class SchoolManager extends ZermeloManager {
  String school;
  String accessToken;

  getAll() async {
    final response = await http.get(
        ZermeloUtil.createApiURL(this.school, "schools", this.accessToken));
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map((school) => School.fromJson(json.decode(school)))
          .toList();
    } else {
      throw Exception('Failed to load school');
    }
  }

  get({String id}) async {
    final response = await http.get(
        ZermeloUtil.createApiURL(this.school, "schools/$id", this.accessToken));
    if (response.statusCode == 200) {
      return School.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load school');
    }
  }

  SchoolManager(String school, String accesstoken) {
    this.school = school;
    this.accessToken = accesstoken;
  }
}

import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/pokemon.dart';

class ApiService {
  Future<List<Pokemon>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Pokemon> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

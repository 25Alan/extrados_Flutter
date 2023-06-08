import 'dart:convert';

import 'package:http/http.dart';
import 'package:tuto_bloc/models/models.dart';

class UserRepository {
  String endpoint = 'https://pokeapi.co/api/v2/pokemon';
  Future<List<PokeModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      return result.map((e) => PokeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

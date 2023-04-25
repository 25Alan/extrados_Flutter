// To parse this JSON data, do
//
//     final actorResponse = actorResponseFromMap(jsonString);

import 'dart:convert';

class ActorResponse {
  ActorResponse({
    required this.biography,
    this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    required this.imdbId,
    required this.name,
    this.placeOfBirth,
    required this.popularity,
    this.profilePath,
  });

  String biography;
  String? birthday;
  String? deathday;
  int gender;
  String? homepage;
  int id;
  String imdbId;
  String name;
  String? placeOfBirth;
  double popularity;
  String? profilePath;

  factory ActorResponse.fromJson(String str) =>
      ActorResponse.fromMap(json.decode(str));

  factory ActorResponse.fromMap(Map<String, dynamic> json) => ActorResponse(
        biography: json["biography"],
        birthday: (json["birthday"]),
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );
}

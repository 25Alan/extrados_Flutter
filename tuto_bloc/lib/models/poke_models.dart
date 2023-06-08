class PokeModel {
  final String name;
  final String url;
  PokeModel({required this.name, required this.url});

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    return PokeModel(name: json['name'] ?? 'Not', url: json['url'] ?? 'Url');
  }
}

// To parse this JSON data, do
//
//     final responseActor = responseActorFromJson(jsonString);

class ResponseActor {
  ResponseActor({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<ResponseActor> results;
  int totalPages;
  int totalResults;

  factory ResponseActor.fromJson(Map<String, dynamic> json) => ResponseActor(
        page: json["page"],
        results: List<ResponseActor>.from(
            json["results"].map((x) => ResponseActor.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

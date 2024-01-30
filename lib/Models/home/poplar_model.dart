import 'package:movies_app/Models/saved/saved_model.dart';

class PoplarModel {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  PoplarModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PoplarModel.fromJson(Map<String, dynamic> json) => PoplarModel(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}

// class PoplarResult {
//   bool adult;
//   String backdropPath;
//   List<int> genreIds;
//   int id;
//   String originalLanguage;
//   String originalTitle;
//   String overview;
//   double popularity;
//   String posterPath;
//   DateTime releaseDate;
//   String title;
//   bool video;
//   double voteAverage;
//   int voteCount;
//
//   PoplarResult({
//     required this.adult,
//     required this.backdropPath,
//     required this.genreIds,
//     required this.id,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });
//
//   factory PoplarResult.fromJson(Map<String, dynamic> json) => PoplarResult(
//     adult: json["adult"],
//     backdropPath: json["backdrop_path"],
//     genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//     id: json["id"],
//     originalLanguage: json["original_language"],
//     originalTitle: json["original_title"],
//     overview: json["overview"],
//     popularity: json["popularity"]?.toDouble(),
//     posterPath: json["poster_path"],
//     releaseDate: DateTime.parse(json["release_date"]),
//     title: json["title"],
//     video: json["video"],
//     voteAverage: json["vote_average"]?.toDouble(),
//     voteCount: json["vote_count"],
//   );
// }
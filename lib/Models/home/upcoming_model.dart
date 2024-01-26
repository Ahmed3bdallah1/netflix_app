import 'package:movies_app/Models/saved/saved_model.dart';

class UpcomingModel {
  Dates? dates;
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  UpcomingModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingModel.fromJson(Map<String, dynamic> json) => UpcomingModel(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Result>.from(
            json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
//
// class UpcomingResult {
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
//   UpcomingResult({
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
//   factory UpcomingResult.fromJson(Map<String, dynamic> json) => UpcomingResult(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         id: json["id"],
//         originalLanguage: json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         popularity: json["popularity"]?.toDouble(),
//         posterPath: json["poster_path"],
//         releaseDate: DateTime.parse(json["release_date"]),
//         title: json["title"],
//         video: json["video"],
//         voteAverage: json["vote_average"]?.toDouble(),
//         voteCount: json["vote_count"],
//       );
// }

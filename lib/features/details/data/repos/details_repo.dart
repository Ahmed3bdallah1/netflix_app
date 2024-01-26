import 'package:dartz/dartz.dart';
import 'package:movies_app/Models/details/details_model.dart';
import 'package:movies_app/Models/details/similar.dart';
import 'package:movies_app/core/failure/failure.dart';


abstract class DetailsRepo {
  Future<Either<Failures,DetailModel>> getDetails({required int id});
  Future<Either<Failures,SimilarModel>> getSimilar({required int id});
}
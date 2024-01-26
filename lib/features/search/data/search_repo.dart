import 'package:dartz/dartz.dart';
import 'package:movies_app/Models/search/search_model.dart';
import 'package:movies_app/core/failure/failure.dart';

abstract class SearchRepo{
  Future<Either<Failures,SearchModel>> search({required String query});
}
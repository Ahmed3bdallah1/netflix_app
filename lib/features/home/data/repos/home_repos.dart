import 'package:movies_app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../Models/home/poplar_model.dart';
import '../../../../Models/home/top_rated_model.dart';
import '../../../../Models/home/upcoming_model.dart';


abstract class HomeRepo{
  Future<Either<Failures,PoplarModel>> getPopular();
  Future<Either<Failures,TopRatedModel>> getTopRated();
  Future<Either<Failures,UpcomingModel>> getUpcoming();
}
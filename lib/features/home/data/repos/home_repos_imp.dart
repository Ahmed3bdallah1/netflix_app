import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/api_constants.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/remote/dio_helper.dart';
import 'package:movies_app/features/home/data/repos/home_repos.dart';
import '../../../../Models/home/poplar_model.dart';
import '../../../../Models/home/top_rated_model.dart';
import '../../../../Models/home/upcoming_model.dart';

class HomeReposImp extends HomeRepo {
  @override
  Future<Either<Failures, PoplarModel>> getPopular() async {
    try {
      var result = await DioHelperStore.getData(
          url:
              "${ApiConstants.baseUrl}/${ApiConstants.popular}?${ApiConstants.apiKey}");

      PoplarModel poplarModel = PoplarModel.fromJson(result.data);
      return right(poplarModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, TopRatedModel>> getTopRated() async {
    try {
      var result = await DioHelperStore.getData(
          url:
              "${ApiConstants.baseUrl}/${ApiConstants.topRated}?${ApiConstants.apiKey}");

      TopRatedModel topRatedModel = TopRatedModel.fromJson(result.data);
      return right(topRatedModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UpcomingModel>> getUpcoming() async {
    try {
      var result = await DioHelperStore.getData(
          url:
              "${ApiConstants.baseUrl}/${ApiConstants.upcoming}?${ApiConstants.apiKey}");

      UpcomingModel upcomingModel = UpcomingModel.fromJson(result.data);
      return right(upcomingModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

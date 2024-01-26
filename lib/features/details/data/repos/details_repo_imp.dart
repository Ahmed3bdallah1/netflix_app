import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Models/details/details_model.dart';
import 'package:movies_app/Models/details/similar.dart';
import 'package:movies_app/core/api_constants.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/remote/dio_helper.dart';
import 'package:movies_app/features/details/data/repos/details_repo.dart';

class DetailsRepoImp extends DetailsRepo {
  @override
  Future<Either<Failures, DetailModel>> getDetails({required int id}) async {
    try {
      var response = await DioHelperStore.getData(
          url: "${ApiConstants.baseUrl}/$id?${ApiConstants.apiKey}");
      DetailModel detailModel = DetailModel.fromJson(response.data);
      print(detailModel.title);
      return right(detailModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, SimilarModel>> getSimilar({required int id}) async {
    try {
      var response = await DioHelperStore.getData(
          url: "${ApiConstants.baseUrl}/$id/similar?${ApiConstants.apiKey}");
      SimilarModel similarModel = SimilarModel.fromJson(response.data);
      print(similarModel.results?[0].title);
      return right(similarModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

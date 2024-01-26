import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Models/search/search_model.dart';
import 'package:movies_app/core/api_constants.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/remote/dio_helper.dart';
import 'package:movies_app/features/search/data/search_repo.dart';

class SearchRepoImp extends SearchRepo {
  @override
  Future<Either<Failures, SearchModel>> search({required String query}) async {
    try {
      var result = await DioHelperStore.getData(
          url:
              "${ApiConstants.searchBaseUrl}?${ApiConstants.searchApiKeyAndQuery}$query}");

      SearchModel searchModel = SearchModel.fromJson(result.data);
      return right(searchModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

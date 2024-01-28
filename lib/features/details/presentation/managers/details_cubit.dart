import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/details/details_model.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/features/details/data/repos/details_repo_imp.dart';
import 'details_state.dart';


class DetailCubit extends Cubit<DetailStates> {
  DetailCubit(this.detailRpoImp) : super(DetailInitial());
  DetailsRepoImp detailRpoImp;

  static DetailCubit get(context) => BlocProvider.of(context);
  DetailModel? detailModel;
  List<Result> similarList = [];

  void getDetail({required int id}) async {
    emit(DetailLoadingState());
    var result = await detailRpoImp.getDetails(id: id);
    result.fold((l) => emit(DetailFailureState(l.message)), (r) {
      detailModel = r;
      emit(DetailSuccessesState(r));
    });
  }

  void getSimilar({required int id}) async {
    emit(SimilarLoadingState());
    var result = await detailRpoImp.getSimilar(id: id);
    result.fold((l) => emit(SimilarFailureState(l.message)), (r) {
      similarList = r.results ?? [];
      emit(SimilarSuccessesState(r));
    });
  }
}

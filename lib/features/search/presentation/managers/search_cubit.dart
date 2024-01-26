import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/features/search/data/search_repo_imp.dart';
import 'package:movies_app/features/search/presentation/managers/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepoImp searchRepoImp;

  SearchCubit(this.searchRepoImp) : super(SearchInitialState());

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  List<Result> searchList = [];

  void searchMovie({required String name}) async {
    emit(SearchLoadingState());
    var result = await searchRepoImp.search(query: name);
    result.fold((l) {
      print("----failure----");
      print(l.message);
      emit(SearchFailureState(l.message));
    }, (r) {
      searchList = r.results ?? [];
      print(searchList.length);
      emit(SearchSuccessState(r));
    });
  }
}

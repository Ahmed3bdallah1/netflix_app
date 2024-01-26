import 'package:movies_app/Models/search/search_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final SearchModel searchModel;

  SearchSuccessState(this.searchModel);
}

class SearchFailureState extends SearchState {
  final String error;

  SearchFailureState(this.error);
}

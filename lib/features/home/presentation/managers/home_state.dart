import 'package:movies_app/Models/home/poplar_model.dart';
import 'package:movies_app/Models/home/top_rated_model.dart';
import 'package:movies_app/Models/home/upcoming_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

/// Change navigation bar items

class ChangeNavigationState extends HomeState{}

/// poplar states

class PopularLoadingState extends HomeState {}

class PopularSuccessesState extends HomeState {
  PoplarModel popularModel;

  PopularSuccessesState(this.popularModel);
}

class PopularFailureState extends HomeState {
  final String errorMessage;

  PopularFailureState(this.errorMessage);
}

/// upcoming states

class UpComingLoadingState extends HomeState {}

class UpComingSuccessesState extends HomeState {
  UpcomingModel upComingModel;

  UpComingSuccessesState(this.upComingModel);
}

class UpComingFailureState extends HomeState {
  final String errorMessage;

  UpComingFailureState(this.errorMessage);
}


/// top rated states

class TopRatedLoadingState extends HomeState {}

class TopRatedSuccessesState extends HomeState {
  TopRatedModel topRatedModel;

  TopRatedSuccessesState(this.topRatedModel);
}

class TopRatedFailureState extends HomeState {
  final String errorMessage;

  TopRatedFailureState(this.errorMessage);
}

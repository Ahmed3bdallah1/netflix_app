import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/features/home/data/repos/home_repos_imp.dart';
import 'package:movies_app/features/home/presentation/view/screens/home_screen.dart';
import 'package:movies_app/features/saved/presentation/view/saved_screen.dart';
import 'package:movies_app/features/search/presentation/view/search_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeReposImp homeReposImp;

  HomeCubit(this.homeReposImp) : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeNavigation(value) {
    currentIndex = value;
    emit(ChangeNavigationState());
  }

  List<Widget> screens = const [
    HomeScreen(),
    SavedScreen(),
    SearchScreen(),
    SizedBox(),
  ];

  List<Result> popList = [];
  List<Result> upComingList = [];
  List<Result> topRatedList = [];

  void getPopular() async {
    emit(PopularLoadingState());
    var result = await homeReposImp.getPopular();
    result.fold((l) {
      print("----failure----");
      print(l.message);
      emit(PopularFailureState(l.message));
    }, (r) {
      popList = r.results ?? [];
      print(popList.length);
      emit(PopularSuccessesState(r));
    });
  }

  void getUpcoming() async {
    emit(UpComingLoadingState());
    var result = await homeReposImp.getUpcoming();
    result.fold((l) {
      print("----failure----");
      print(l.message);
      emit(UpComingFailureState(l.message));
    }, (r) {
      upComingList = r.results ?? [];
      print(upComingList.length);
      emit(UpComingSuccessesState(r));
    });
  }

  void getTopRated() async {
    emit(TopRatedLoadingState());
    var result = await homeReposImp.getTopRated();
    result.fold((l) => emit(TopRatedFailureState(l.message)), (r) {
      topRatedList = r.results ?? [];
      print(topRatedList.length);
      emit(TopRatedSuccessesState(r));
    });
  }
}

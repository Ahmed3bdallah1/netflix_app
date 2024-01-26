import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/remote/dio_helper.dart';
import 'package:movies_app/core/routes/routes.dart';
import 'package:movies_app/features/home/data/repos/home_repos_imp.dart';
import 'package:movies_app/features/home/presentation/managers/home_cubit.dart';
import 'package:movies_app/features/home/presentation/view/widgets/navigation_bar.dart';
import 'package:movies_app/features/saved/presentation/managers/save_cubit.dart';
import 'package:movies_app/features/search/data/search_repo_imp.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit.dart';
import 'core/bloc_observsr.dart';

void main() async {
  await DioHelperStore.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(HomeReposImp())
            ..getUpcoming()
            ..getTopRated()
            ..getPopular(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => SearchCubit(SearchRepoImp()),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => SaveCubit(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix App',
        theme: ThemeData.dark(),
        home: const HomeNavBar(),
        onGenerateRoute: (settings) => Routes.onGenerated(settings),
      ),
    );
  }
}

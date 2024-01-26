import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:movies_app/features/home/presentation/managers/home_cubit.dart';
import 'package:movies_app/features/home/presentation/managers/home_state.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0x4DDADADA),
              border: Border.all(
                color: const Color(0x40FFFFFF),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 6)),
              ],
            ),
            child: NavigationBar(
              selectedIndex: cubit.currentIndex,
              onDestinationSelected: (int index) {
                cubit.changeNavigation(index);
              },
              indicatorColor: Colors.white,
              destinations: const [
                NavigationDestination(
                  tooltip: "Home",
                  selectedIcon: Icon(
                    IconlyBold.home,
                    color: Colors.deepOrange,
                  ),
                  icon: Icon(
                    IconlyLight.home,
                    color: Colors.white,
                  ),
                  label: "Home",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    IconlyBold.bookmark,
                    color: Colors.deepOrange,
                  ),
                  icon: Icon(
                    IconlyLight.bookmark,
                    color: Colors.white,
                  ),
                  label: "Saved",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    IconlyBold.search,
                    color: Colors.deepOrange,
                  ),
                  icon: Icon(
                    IconlyLight.search,
                    color: Colors.white,
                  ),
                  label: "Search",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    IconlyBold.setting,
                    color: Colors.deepOrange,
                  ),
                  icon: Icon(
                    IconlyLight.setting,
                    color: Colors.white,
                  ),
                  label: "Settings",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

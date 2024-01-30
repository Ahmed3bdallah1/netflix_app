import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/managers/home_cubit.dart';
import 'package:movies_app/features/search/presentation/managers/search_cubit.dart';
import 'package:movies_app/features/search/presentation/managers/search_state.dart';
import 'package:movies_app/features/search/presentation/view/search_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    String searchQuery = '';

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchCubit cubit = SearchCubit.get(context);
        HomeCubit homeCubit = HomeCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: searchController,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  searchController.clear();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                              hintStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                                gapPadding: 0,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 20,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              alignLabelWithHint: true,
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) {
                              searchQuery = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            searchQuery = searchController.text;
                            context
                                .read<SearchCubit>()
                                .searchMovie(name: searchQuery);
                          },
                          child: Container(
                            height: 38,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffF62E1F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.58,
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchInitialState) {
                            return const Center(
                              child: Text('Please enter your movie name'),
                            );
                          }
                          if (state is SearchLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepOrange,
                              ),
                            );
                          } else if (state is SearchFailureState) {
                            return const Center(
                              child: Text('Unable to find your needs'),
                            );
                          }
                          return cubit.searchList.isEmpty
                              ? const Center(
                                  child:
                                      Text("There is nothing meets your words"),
                                )
                              : ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => SearchItem(
                                      searchResult: cubit.searchList[index]),
                                  itemCount: cubit.searchList.length,
                                );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.3),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text("Popular now"),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.58,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<SearchCubit, SearchState>(
                              builder: (context, state) {
                                return ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            SearchItem(
                                                searchResult:
                                                    homeCubit.popList[index]),
                                        itemCount: homeCubit.popList.length,
                                      );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

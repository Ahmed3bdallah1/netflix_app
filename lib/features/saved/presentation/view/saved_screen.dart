import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/saved/presentation/managers/save_cubit.dart';
import 'package:movies_app/features/saved/presentation/managers/save_state.dart';
import 'package:movies_app/features/search/presentation/view/search_item.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return BlocConsumer<SaveCubit, SaveState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        SaveCubit cubit = SaveCubit.get(context);
        return cubit.savedItems.isNotEmpty
            ? Scaffold(
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.grey)),
                        child: const Center(
                          child: Text("Saved Items"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.6),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.grey)),
                        child: Center(child: Text("Total Items: ${cubit.savedItems.length}")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: height*.58,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: SearchItem(
                                  searchResult: cubit.savedItems[index]),
                            );
                          },
                          itemCount: cubit.savedItems.length,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.6),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          border: Border.all(color: Colors.grey)),
                      child: const Center(
                        child: Text("Saved Items"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: const Center(child: Text("There is nothing here")),
                  ),
                ],
              );
      },
    );
  }
}

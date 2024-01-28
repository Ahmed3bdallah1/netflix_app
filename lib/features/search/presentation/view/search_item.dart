import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/Models/search/search_model.dart';
import 'package:movies_app/core/utils/custom_snak_bar.dart';
import 'package:movies_app/features/details/presentation/view/details_screen.dart';
import 'package:movies_app/features/saved/presentation/managers/save_cubit.dart';
import 'package:movies_app/features/saved/presentation/managers/save_state.dart';

import '../../../../core/api_constants.dart';

class SearchItem extends StatelessWidget {
  final Result searchResult;

  const SearchItem({super.key, required this.searchResult});

  @override
  Widget build(BuildContext context) {
    SaveCubit cubit = SaveCubit.get(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsScreen(id: searchResult.id ?? 0)));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Card(
            elevation: 0,
            borderOnForeground: true,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0x4DDADADA),
                  border: Border.all(
                    color: const Color(0x40FFFFFF),
                  ),
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              width: 220,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${ApiConstants.coverImageUrl}${searchResult.posterPath}",
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: 5,
                            child: BlocConsumer<SaveCubit, SaveState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return cubit.isResultSaved(
                                            resultId: searchResult.id ?? 0) ==
                                        true
                                    ? IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark_added_rounded,
                                          color: Colors.blue,
                                          size: 50,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          showSnakBar(context,
                                              "${searchResult.title} added to the saved screen");
                                          cubit.toSave(result: searchResult);
                                        },
                                        icon: const Icon(
                                          Icons.bookmark_add,
                                          size: 50,
                                        ));
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(searchResult.title ?? "Unknown",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 30,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${searchResult.voteAverage}".substring(0, 3),
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  "${searchResult.releaseDate}"
                                      .substring(2, 10),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}

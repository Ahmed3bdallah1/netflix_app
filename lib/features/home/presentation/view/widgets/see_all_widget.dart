import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/features/details/presentation/view/details_screen.dart';

import '../../../../../core/api_constants.dart';
import '../../../../../core/utils/custom_snak_bar.dart';
import '../../../../saved/presentation/managers/save_cubit.dart';
import '../../../../saved/presentation/managers/save_state.dart';

class SeeAllItem extends StatelessWidget {
  final Result result;
  const SeeAllItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsScreen(id: result.id ?? 0)));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0x4DDADADA),
                border: Border.all(
                  color: const Color(0x40FFFFFF),
                ),
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            width: 180,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl:
                            "${ApiConstants.coverImageUrl}${result.posterPath}",
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
                              SaveCubit cubit = SaveCubit.get(context);
                              return cubit.isResultSaved(
                                  resultId: result.id ?? 0) ==
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
                                        "${result.title} added to the saved screen");
                                    cubit.toSave(result: result);
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
                      child: Text(result.title ?? "Unknown",
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
                          padding: const EdgeInsets.only(top: 8,bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "${result.voteAverage}"
                                    .substring(0, 3),
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                "${result.releaseDate}"
                                    .substring(2, 10),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          )),
    );
  }
}

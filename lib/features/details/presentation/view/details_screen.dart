import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/details/similar.dart';
import 'package:movies_app/core/api_constants.dart';
import 'package:movies_app/features/details/data/repos/details_repo_imp.dart';
import 'package:movies_app/features/details/presentation/managers/details_cubit.dart';
import 'package:movies_app/features/details/presentation/view/similar_item.dart';
import '../managers/details_state.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DetailCubit(DetailsRepoImp())
          ..getDetail(id: id)
          ..getSimilar(id: id),
        child: BlocConsumer<DetailCubit, DetailStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DetailCubit cubit = DetailCubit.get(context);
            if (state is SimilarLoadingState || state is DetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailFailureState) {
              return const Center(
                  child: Text("Unable to find this page please try again"));
            }
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SizedBox(
                              height: 200,
                              child: Center(
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "${ApiConstants.coverImageUrl}${cubit.detailModel?.backdropPath}",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${cubit.detailModel?.title}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const SizedBox(),
                                const Icon(
                                  Icons.star,
                                  size: 30,
                                  color: Colors.yellow,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "${cubit.detailModel?.voteAverage}"
                                      .substring(0, 3),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Spacer(),
                                Text(
                                  "${cubit.detailModel?.releaseDate}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              itemCount: cubit.detailModel?.genres?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  width: 100,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "${cubit.detailModel?.genres?[index].name}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text("Description",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                          Text(
                            "${cubit.detailModel?.overview}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Related Movies",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => SimilarItem(
                                  similarResult: cubit.similarList[index]),
                              itemCount: cubit.similarList.length,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/api_constants.dart';
import 'package:movies_app/features/details/presentation/view/details_screen.dart';
import 'package:movies_app/features/home/presentation/managers/home_cubit.dart';

class PopularBanner extends StatelessWidget {
  final HomeCubit cubit;

  const PopularBanner({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        disableGesture: true,
        items: cubit.popList
            .map(
              (e) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailsScreen(id: e.id!)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl:
                            "${ApiConstants.coverImageUrl}${e.backdropPath}",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                                color: const Color(0x4DDADADA),
                                border: Border.all(
                                  color: const Color(0x40FFFFFF),
                                ),
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20))),
                            child: Text(
                              e.title!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                                letterSpacing: 0.32,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            height: 200,
            aspectRatio: 20 / 5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            pageSnapping: true));
  }
}

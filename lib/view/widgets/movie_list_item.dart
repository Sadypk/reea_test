import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reea_test/models/movie.dart';
import 'package:reea_test/resources/app_colors.dart';
import 'package:reea_test/resources/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width: 130,
            color: movie.posterPath != null ? null : AppColors.grey,
            child: movie.posterPath != null
                ? Hero(
                    tag: movie.id.toString,
                    child: CachedNetworkImage(
                      imageUrl: movie.imageUrl(),
                      imageBuilder:
                          (BuildContext context, ImageProvider imageProvider) =>
                              Container(
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 200,
                          width: 130,
                          decoration: BoxDecoration(color: AppColors.grey),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(color: AppColors.grey),
                        child: const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title ?? '',
                  style: AppTextStyles.movieHeader,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.getGenres().join(', '),
                  style: AppTextStyles.genreText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.starYellow,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: '${movie.voteAverage}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.white),
                        ),
                        TextSpan(
                          text: '/10',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: AppColors.white.withOpacity(0.6)),
                        ),
                      ]),
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    //     RichText(
                    //       text: TextSpan(children: <TextSpan>[
                    //         TextSpan(
                    //           text: '${movie.voteAverage}',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 14,
                    //               color: AppColors.white),
                    //         ),
                    //         TextSpan(
                    //           text: '/10',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 12,
                    //               color: AppColors.white.withOpacity(0.6)),
                    //         ),
                    //       ]),
                    //     ),
                    //     Text(
                    //       '${(movie.voteCount! / 1000).toStringAsFixed(1)}K',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 10,
                    //         color: AppColors.white.withOpacity(0.6),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Text(
                    movie.overview ?? '',
                    style: AppTextStyles.descriptionText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 9,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerMovieListItem extends StatelessWidget {
  const ShimmerMovieListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width: 130,
            color: AppColors.grey,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 18,
                  width: 80,
                  color: AppColors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 11,
                  width: 80,
                  color: AppColors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.starYellow,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 10,
                      width: 80,
                      color: AppColors.grey,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    //     RichText(
                    //       text: TextSpan(children: <TextSpan>[
                    //         TextSpan(
                    //           text: '${movie.voteAverage}',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 14,
                    //               color: AppColors.white),
                    //         ),
                    //         TextSpan(
                    //           text: '/10',
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 12,
                    //               color: AppColors.white.withOpacity(0.6)),
                    //         ),
                    //       ]),
                    //     ),
                    //     Text(
                    //       '${(movie.voteCount! / 1000).toStringAsFixed(1)}K',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 10,
                    //         color: AppColors.white.withOpacity(0.6),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                      Container(
                        height: 12,
                        width: Get.width,
                        color: AppColors.grey,
                        margin: const EdgeInsets.only(bottom: 5),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

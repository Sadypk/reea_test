import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reea_test/controller/movie_controller.dart';
import 'package:reea_test/resources/app_colors.dart';
import 'package:reea_test/resources/app_text_styles.dart';
import 'package:reea_test/resources/images.dart';
import 'package:reea_test/view/movie_details_screen.dart';
import 'package:reea_test/view/settings_screem.dart';
import 'package:reea_test/view/widgets/movie_list_item.dart';
import 'package:shimmer/shimmer.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  MovieController controller = Get.find();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // For loading indicator when fetching new data
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        controller.nextPage();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: <Widget>[
                // background image
                Blur(
                  blur: 5,
                  blurColor: AppColors.black,
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.listBackground),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // appbar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'movies'.tr,
                          style: AppTextStyles.title,
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: AppColors.grey),
                          onPressed: () => Get.to(const SettingsScreen()),
                        ),
                      ],
                    ).paddingAll(15),

                    //movie list
                    Expanded(
                      child: controller.movies.isNotEmpty
                          ? ListView.builder(
                              controller: scrollController,
                              itemCount: controller.movies.length,
                              padding: const EdgeInsets.all(15),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () => Get.to(MovieDetailsScreen(
                                      movie: controller.movies[index])),
                                  child: MovieListItem(
                                    movie: controller.movies[index],
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: 10,
                              padding: const EdgeInsets.all(15),
                              itemBuilder: (BuildContext context, int index) =>
                                  Opacity(
                                    opacity: 0.5,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.white,
                                      child: const ShimmerMovieListItem(),
                                    ),
                                  )),
                    ),
                  ],
                ),

                // loading indicator when fetching new data
                if (controller.isFetchingData.value &&
                    controller.movies.isNotEmpty)
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

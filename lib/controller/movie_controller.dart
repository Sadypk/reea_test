import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:reea_test/controller/hive_controller.dart';
import 'package:reea_test/models/movie.dart';
import 'package:reea_test/repositories/movie_repository.dart';

class MovieController extends GetxController{
  RxList<Movie> movies = <Movie>[].obs;
  RxInt currentPage = 1.obs;
  RxBool isFetchingData = false.obs;
  MovieRepository movieRepository = Get.find();
  HiveController hiveController = HiveController();

  @override
  void onInit() {
    manageCacheData();
    super.onInit();
  }

  void manageCacheData() async{
    Box<Movie> box = await hiveController.openBox();
    List<Movie> cachedList = hiveController.getCachedMovies(box);
    List<Movie> queriedList = <Movie>[];

    // if cache has data show cache data while api fetches new data
    if(cachedList.isNotEmpty){
      movies.addAll(cachedList);
      queriedList.addAll(await getCurrentPageData(currentPage.value));
      if(queriedList.isNotEmpty){
        movies.clear();
        movies.addAll(queriedList);

        // replace cache data with new data
        hiveController.clearCache(box);
        for (Movie movie in queriedList) {
          hiveController.addMoviesToCache(box, movie);
        }}
    }else{

      // cache is empty, fetch new api data
      queriedList.addAll(await getCurrentPageData(currentPage.value));
      movies.addAll(queriedList);

      // add data to cache
      for (Movie movie in queriedList) {
        hiveController.addMoviesToCache(box, movie);
      }
    }
  }

  // fetching next page data
  void nextPage()async{
    int nextPage = currentPage.value+1;
    isFetchingData.value = true;
    movies.addAll(await getCurrentPageData(nextPage));
    isFetchingData.value = false;
    currentPage.value++;
  }

  // get data for a specific page
  Future<List<Movie>> getCurrentPageData(int page) async => await movieRepository.getMovies('/movie/popular', addedQuery: {'page': page});
}
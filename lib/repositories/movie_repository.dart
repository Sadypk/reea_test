import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:reea_test/app_config.dart';
import 'package:reea_test/models/movie.dart';

class MovieRepository{
  final Dio dio = Dio();
  final Logger logger = Logger();
  final AppConfig config = AppConfig();

  Future<List<Movie>> getMovies(String path, {Map<String, dynamic>? addedQuery})async{
    List<Movie> list = <Movie>[];
    try{
      String url = '${config.baseApiUrl}$path';
      Map<String, dynamic> query = {
        'api_key': config.apiKey,
        'language' : 'en-US'
      };

      if(addedQuery != null){
        query.addAll(addedQuery);
      }
      Response response = await dio.get(url, queryParameters: query);
      if(response.data['results'] != null){
        response.data['results'].forEach((val){
          list.add(Movie.fromJson(val));
        });
      }else {
        logger.i(response.data);
      }
    } on DioError catch(e){
      logger.e(e);
    }
    return list;
  }
}
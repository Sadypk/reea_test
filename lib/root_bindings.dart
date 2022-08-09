import 'package:get/get.dart';
import 'package:reea_test/controller/movie_controller.dart';
import 'package:reea_test/controller/settings_controller.dart';
import 'package:reea_test/repositories/movie_repository.dart';

class RootBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(MovieRepository());
    Get.put(MovieController());
    Get.put(SettingsController());
  }

}
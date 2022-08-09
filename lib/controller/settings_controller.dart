import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SettingsController extends GetxController{
  RxString language = 'english'.obs;
  Rx<LatLng> userPosition = LatLng(33.6844, 73.0479).obs;

  @override
  void onInit() {
    getUserLocation();
    super.onInit();
  }

  void getUserLocation()async{
    await Geolocator.requestPermission().then((value) async {
      Position position  = await Geolocator.getCurrentPosition();
      userPosition.value = LatLng(position.latitude, position.longitude);
    });
  }

  void onChangeLanguage(String? value){
    switch(value){
      case 'english' : {
         language.value = value!;
         Get.updateLocale(const Locale('en', 'US'));
      }
      break;
      case 'spanish' : {
        language.value = value!;
        Get.updateLocale(const Locale('es', 'ES'));
      }
      break;
    }
  }
}
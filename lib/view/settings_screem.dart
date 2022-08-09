import 'dart:async';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reea_test/controller/settings_controller.dart';
import 'package:reea_test/resources/app_colors.dart';
import 'package:reea_test/resources/app_text_styles.dart';
import 'package:reea_test/resources/images.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsController controller = Get.find();
  final Completer<GoogleMapController> mapController = Completer();
  late CameraPosition cameraPosition;
  late List<Marker> markers;

  @override
  void initState() {
    cameraPosition = CameraPosition(
      target: controller.userPosition.value,
      zoom: 14,
    );
    markers = <Marker>[
      Marker(
        markerId: const MarkerId('1'),
        position: controller.userPosition.value,
        infoWindow: const InfoWindow(title: 'You'),
      ),
    ];
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'settings'.tr,
                        style: AppTextStyles.title,
                      ),
                      const SizedBox(
                        height: 25,
                      ),


                      // Language control
                      Text(
                        'language'.tr,
                        style: AppTextStyles.descriptionSectionHeaderText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Radio<String>(
                            value: 'english',
                            groupValue: controller.language.value,
                            onChanged: controller.onChangeLanguage,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'english'.tr,
                            style: AppTextStyles.descriptionText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Radio<String>(
                              value: 'spanish',
                              groupValue: controller.language.value,
                              onChanged: controller.onChangeLanguage),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'spanish'.tr,
                            style: AppTextStyles.descriptionText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),


                      // User location preview
                      Text(
                        'location'.tr,
                        style: AppTextStyles.descriptionSectionHeaderText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: Get.width,
                        width: Get.width,
                        child: GoogleMap(
                          initialCameraPosition: cameraPosition,
                          markers: Set<Marker>.of(markers),
                          onMapCreated:
                              (GoogleMapController googleMapController) {
                            mapController.complete(googleMapController);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

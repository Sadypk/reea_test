import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reea_test/resources/app_colors.dart';

// holds all the text styles used by app
class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 24,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        // bottomLeft
        offset: const Offset(-1, -1),
        color: AppColors.outlineColor,
      ),
      Shadow(
        // bottomRight
        offset: const Offset(1, -1),
        color: AppColors.outlineColor,
      ),
      Shadow(
        // topRight
        offset: const Offset(1, 1),
        color: AppColors.outlineColor,
      ),
      Shadow(
        // topLeft
        offset: const Offset(-1, 1),
        color: AppColors.outlineColor,
      ),
    ],
  );

  static TextStyle movieHeader = TextStyle(
    fontSize: 18,
    color: AppColors.white.withOpacity(0.8),
  );

  static TextStyle movieDetailsHeader = TextStyle(
    fontSize: 24,
    color: AppColors.white.withOpacity(0.8),
  );

  static TextStyle genreText = TextStyle(
    fontSize: 11,
    color: AppColors.genre,
  );

  static TextStyle descriptionText = TextStyle(
    fontSize: 12,
    color: AppColors.white.withOpacity(0.5),
  );

  static TextStyle descriptionSectionHeaderText = TextStyle(
    fontSize: 12,
    color: AppColors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold,
  );
}

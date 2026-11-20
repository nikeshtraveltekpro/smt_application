import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/utils/app_colors.dart';

class AppSnackbar {
  static void showInfo(String title, String message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.white,
      colorText: AppColors.blackSolid,
      icon: const Icon(Icons.info_outline, color: AppColors.red),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
    );
  }
}

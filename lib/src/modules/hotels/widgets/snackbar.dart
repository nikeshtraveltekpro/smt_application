import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/common_asset_image.dart';

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

  static final RxString titleObs = "".obs;
  static final RxString messageObs = "".obs;
  static void showSwapInfo(String title, String message) {
    titleObs.value = title;
    messageObs.value = message;
    if (Get.isSnackbarOpen) {
      return;
    }

    Get.snackbar(
      '',
      '',
      titleText: Obx(
        () => Text(
          titleObs.value,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontWeight: .w500,
            fontSize: 16,
          ),
        ),
      ),
      messageText: Obx(
        () => Text(
          messageObs.value,
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontWeight: .w400,
            fontSize: 12,
          ),
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.textIconBlue,
      colorText: AppColors.white,

      icon: const Padding(
        padding: EdgeInsets.only(top: 16, left: 12, bottom: 16, right: 7),

        child: CommonAssetImage(image: Assets.greenTick, height: 34, width: 34),
      ),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
    );
  }
}

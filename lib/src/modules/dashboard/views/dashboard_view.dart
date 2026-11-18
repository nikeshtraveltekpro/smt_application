import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';
import 'package:svg_flutter/svg.dart';

import '../controllers/dashboard_controller.dart';
import '../enums/screens_enums.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: controller.currentIndex.value,
              children: BodyScreens.values
                  .map((screen) => screen.screens)
                  .toList(),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 23,
              child: Stack(
                alignment: .center,
                clipBehavior: .none,
                children: [
                  Container(
                    height: 65,
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      color: AppColors.bottom_bg,
                      borderRadius: .circular(54),
                      border: Border.all(color: AppColors.white, width: 1),
                    ),

                    child: ClipRRect(
                      borderRadius: .circular(54),

                      child: BottomNavigationBar(
                        currentIndex: controller.currentIndex.value,
                        onTap: controller.selectedIndex,
                        backgroundColor: AppColors.bottom_bg,
                        elevation: 0,
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: AppColors.red,
                        unselectedItemColor: AppColors.blue,
                        unselectedLabelStyle: CustomTextstyle.semiBoldText11,
                        selectedLabelStyle: CustomTextstyle.semiBoldText11,
                        items: BodyScreens.values.map((item) {
                          if (item == BodyScreens.sniggy) {
                            return BottomNavigationBarItem(
                              icon: Padding(
                                padding: .symmetric(vertical: 4),
                                child: SizedBox(height: 20, width: 20),
                              ),
                              activeIcon: Padding(
                                padding: .symmetric(vertical: 4),
                                child: SizedBox(height: 20, width: 20),
                              ),
                              label: item.title,
                            );
                          }
                          return BottomNavigationBarItem(
                            icon: Padding(
                              padding: .symmetric(vertical: 4),
                              child: SvgPicture.asset(
                                item.icon,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            label: item.title,
                            activeIcon: Padding(
                              padding: .symmetric(vertical: 4),
                              child: SvgPicture.asset(
                                item.selectedIcon,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Positioned(left: 142, top: -45, child: SniggyBottomButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SniggyBottomButton extends GetView<DashboardController> {
  const SniggyBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedIndex(BodyScreens.sniggy.index);
      },
      child: Container(
        height: 110,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow_blue,
              offset: Offset.zero,
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: CommonAssetImage(
          image: BodyScreens.sniggy.icon,
          height: 80,
          width: 56,
          fit: .cover,
        ),
      ),
    );
  }
}

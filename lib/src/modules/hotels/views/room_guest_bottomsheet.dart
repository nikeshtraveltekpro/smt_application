import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:smt_application/src/modules/hotels/controllers/hotel_controller.dart';
import 'package:smt_application/src/modules/hotels/widgets/bottomsheet_title.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class RoomGuestBottomsheet extends GetView<HotelController> {
  const RoomGuestBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: controller.height.value,
        width: .infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            const BottomSheetTitle(title: HotelConstants.addRoomsAndGuestsTitle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 3,
                width: 50.5,
                color: AppColors.textIconBlue,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: RoomRawListWidget(controller: controller),
              ),
            ),
            IncreaseRoomWidget(controller: controller),
            const ContinueButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class ContinueButtonWidget extends GetView<HotelController> {
  const ContinueButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.confirmRoomAndGuests,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Container(
          height: 44,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              HotelConstants.continueButton,
              style: CustomTextstyle.bold600Text14,
            ),
          ),
        ),
      ),
    );
  }
}

class IncreaseRoomWidget extends StatelessWidget {
  const new({super.key, required this.controller});

  final HotelController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.addRoom,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Row(
          children: [
            Stack(
              alignment: .center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 6.5),
                  width: 1.5,
                  height: 10.62,
                  decoration: BoxDecoration(
                    borderRadius: .circular(2),
                    color: AppColors.red,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 6.5),
                  width: 10.62,
                  height: 1.5,
                  decoration: BoxDecoration(
                    borderRadius: .circular(2),
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
            Text(HotelConstants.addRoom, style: CustomTextstyle.addRoomRed15),
          ],
        ),
      ),
    );
  }
}

class RoomRawListWidget extends StatelessWidget {
  const new({super.key, required this.controller});

  final HotelController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List.generate(controller.roomList.length, (index) {
          if (index == 0) {
            return CommonRoomWidget(count: 1, index: index);
          }
          return CommonRoomWidget(
            isIndexZero: false,
            count: index + 1,
            index: index,
          );
        }),
      ),
    );
  }
}

class CommonRoomWidget extends GetView<HotelController> {
  const new({
    super.key,
    this.isIndexZero = true,
    required this.count,
    required this.index,
  });
  final bool isIndexZero;
  final int count;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Obx(
        () => Column(
          crossAxisAlignment: .start,

          children: [
            Text("Room $count", style: CustomTextstyle.boldText14Blue),
            const SizedBox(height: 6),
            AddRemoveRowWidget(
              title: HotelConstants.adultsTitle,
              subTitle: HotelConstants.adultsAgeSubtitle,
              total: controller.roomList[index].adults,
              onAdd: () => controller.increaseAdult(index),
              onSub: () => controller.decreaseAdult(index),
            ),
            const SizedBox(height: 12),

            AddRemoveRowWidget(
              title: HotelConstants.childrenTitle,
              subTitle: HotelConstants.childrenAgeSubtitle,
              total: controller.roomList[index].children,
              onAdd: () => controller.increaseChildren(index),
              onSub: () => controller.decreaseChildren(index),
            ),
            Obx(
              () => controller.roomList[index].children.value == 0
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final itemWidth = (constraints.maxWidth - 16) / 3;
                          return Wrap(
                            spacing: 8,
                            runSpacing: 10,
                            children: List.generate(
                              controller.roomList[index].children.value,
                              (childIndex) => SizedBox(
                                width: itemWidth,
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text(
                                      'Child ${childIndex + 1} Age',
                                      style: CustomTextstyle.childAgeLabel,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 52,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: AppColors.grey2.withValues(
                                            alpha: 0.18,
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Obx(() {
                                        final selectedAge = controller
                                            .roomList[index]
                                            .childAges[childIndex];
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: selectedAge,
                                            isExpanded: true,
                                            isDense: true,
                                            icon: const SizedBox.shrink(),
                                            style: CustomTextstyle
                                                .normal400Text12
                                                .copyWith(fontSize: 14),
                                            items:
                                                [
                                                      'Under 1',
                                                      for (
                                                        int age = 1;
                                                        age <= 12;
                                                        age++
                                                      )
                                                        '$age',
                                                    ]
                                                    .map(
                                                      (age) =>
                                                          DropdownMenuItem<
                                                            String
                                                          >(
                                                            value: age,
                                                            child: Text(age),
                                                          ),
                                                    )
                                                    .toList(),
                                            onChanged: (age) {
                                              if (age != null) {
                                                controller.updateChildAge(
                                                  index,
                                                  childIndex,
                                                  age,
                                                );
                                              }
                                            },
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),

            isIndexZero ? const SizedBox(height: 0) : RemoveRoomWidgets(index: index),
            const SizedBox(height: 10),
            const DividerBorderWidget(),
          ],
        ),
      ),
    );
  }
}

class DividerBorderWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: .infinity,
      decoration: BoxDecoration(color: AppColors.grey2.withValues(alpha: 0.14)),
    );
  }
}

class RemoveRoomWidgets extends GetView<HotelController> {
  const new({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.removeRoom(index),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: .end,
          children: [
            const MinusIconWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                HotelConstants.removeRoom,
                style: CustomTextstyle.normal400Text12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddRemoveRowWidget extends GetView<HotelController> {
  const new({
    super.key,
    required this.title,
    required this.subTitle,
    required this.total,
    this.onAdd,
    this.onSub,
  });
  final String title;
  final String subTitle;
  final RxInt total;
  final void Function()? onAdd;
  final void Function()? onSub;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(title, style: CustomTextstyle.recentHotelCity),
            Text(subTitle, style: CustomTextstyle.normal400Text12),
          ],
        ),
        const Spacer(),
        IconWidget(onSub: onSub),
        Container(
          height: 32,
          width: 32,
          alignment: .center,
          decoration: BoxDecoration(borderRadius: .circular(8)),
          child: Obx(() => Text("$total")),
        ),
        IconWidget(isAdd: true, onAdd: onAdd),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  const new({super.key, this.isAdd = false, this.onAdd, this.onSub});
  final bool isAdd;
  final void Function()? onAdd;
  final void Function()? onSub;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAdd ? onAdd : onSub,
      child: Container(
        height: 32,
        width: 32,
        alignment: .center,
        decoration: BoxDecoration(
          borderRadius: .circular(8),
          border: .all(width: 1, color: AppColors.greyBorder),
        ),

        child: isAdd
            ? Stack(
                alignment: .center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 6.5),
                    width: 1.5,
                    height: 10.62,
                    decoration: BoxDecoration(
                      borderRadius: .circular(2),
                      color: AppColors.grey2,
                    ),
                  ),
                  const MinusIconWidget(),
                ],
              )
            : Container(
                padding: const EdgeInsets.only(top: 10, left: 6.5),
                width: 10.62,
                height: 1.5,
                decoration: BoxDecoration(
                  borderRadius: .circular(2),
                  color: AppColors.grey2,
                ),
              ),
      ),
    );
  }
}

class MinusIconWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 6.5),
      width: 10.62,
      height: 1.5,
      decoration: BoxDecoration(
        borderRadius: .circular(2),
        color: AppColors.grey2,
      ),
    );
  }
}

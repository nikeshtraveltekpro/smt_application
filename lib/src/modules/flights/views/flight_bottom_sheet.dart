import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/flights/controllers/flights_controller.dart';
import 'package:smt_application/src/modules/flights/widgets/flight_constants.dart';
import 'package:smt_application/src/modules/hotels/views/room_guest_bottomsheet.dart';
import 'package:smt_application/src/modules/hotels/widgets/bottomsheet_title.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class TravellersClassBottomsheet extends GetView<FlightsController> {
  const TravellersClassBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: .vertical(top: .circular(28)),
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          const BottomSheetTitle(title: FlightConstants.selectTravellersAndClass),
          Padding(
            padding: const .symmetric(horizontal: 20),
            child: Container(
              height: 3,
              width: 50.5,
              color: AppColors.textIconBlue,
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const .symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  FlightConstants.travellers,
                  style: CustomTextstyle.boldText14Blue,
                ),
                const SizedBox(height: 14),
                AddRemoveRowWidget(
                  title: FlightConstants.adults,
                  subTitle: FlightConstants.adultsAge,
                  total: controller.adultsCount,
                  onAdd: controller.increaseAdults,
                  onSub: controller.decreaseAdults,
                ),
                const SizedBox(height: 14),
                AddRemoveRowWidget(
                  title: FlightConstants.children,
                  subTitle: FlightConstants.childrenAge,
                  total: controller.childrenCount,
                  onAdd: controller.increaseChildren,
                  onSub: controller.decreaseChildren,
                ),
                const SizedBox(height: 14),
                AddRemoveRowWidget(
                  title: FlightConstants.infants,
                  subTitle: FlightConstants.infantsAge,
                  total: controller.infantsCount,
                  onAdd: controller.increaseInfants,
                  onSub: controller.decreaseInfants,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => GestureDetector(
                    onTap: () => controller.isMoreThan9Travellers.toggle(),
                    child: Container(
                      width: .infinity,
                      padding: const .symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3FA),
                        borderRadius: .circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: controller.isMoreThan9Travellers.value,
                              onChanged: (val) =>
                                  controller.isMoreThan9Travellers.value =
                                      val ?? false,
                              activeColor: AppColors.red,
                              side: BorderSide(
                                color: AppColors.grey2.withValues(alpha: 0.4),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: .circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            FlightConstants.moreThan9Travellers,
                            style: CustomTextstyle.normalText12.copyWith(
                              fontSize: 14,
                              color: AppColors.textIconBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const DividerBorderWidget(),
                const SizedBox(height: 18),
                Text(
                  FlightConstants.cabinClass,
                  style: CustomTextstyle.boldText14Blue,
                ),
                const SizedBox(height: 12),
                Obx(
                  () => Column(
                    children: controller.cabinClasses.map((cabin) {
                      final isSelected =
                          controller.selectedCabinClass.value == cabin;
                      return GestureDetector(
                        onTap: () =>
                            controller.selectedCabinClass.value = cabin,
                        child: Padding(
                          padding: const .symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: .circle,
                                  border: .all(
                                    color: isSelected
                                        ? AppColors.red
                                        : AppColors.grey2.withValues(
                                            alpha: 0.4,
                                          ),
                                    width: 1.5,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: const BoxDecoration(
                                            shape: .circle,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                cabin,
                                style: CustomTextstyle.normalText12.copyWith(
                                  fontSize: 14,
                                  color: AppColors.textIconBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const .symmetric(vertical: 14, horizontal: 20),
              child: Container(
                height: 48,
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: .circular(12),
                ),
                child: Center(
                  child: Text(
                    FlightConstants.continueButton,
                    style: CustomTextstyle.bold600Text14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_application/src/modules/hotels/controllers/hotel_controller.dart';
import 'package:smt_application/src/modules/hotels/widgets/bottomsheet_title.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class RoomPriceBottomsheet extends GetView<HotelController> {
  const RoomPriceBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.30,
      width: .infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          BottomSheetTitle(title: HotelConstants.pricePerNightTitle),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 3,
              width: 50.5,
              color: AppColors.dark_blue,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Material(
                type: MaterialType.transparency,
                child: Obx(() {
                  final selected = controller.selectedPrice.value;
                  final prices = controller.priceList;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: prices.length,
                    itemBuilder: (context, index) {
                      final currentPrice = controller.priceList[index].price;
                      final isSelected = selected == currentPrice;
                      return PriceRadioChoiceCard(
                        isSelected: isSelected,
                        currentPrice: currentPrice,
                        onTap: () => controller.selectPrice(currentPrice),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceRadioChoiceCard extends StatelessWidget {
  const new({
    super.key,
    required this.isSelected,
    required this.currentPrice,
    this.onTap,
  });

  final bool isSelected;
  final String currentPrice;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 8),
        child: SizedBox(
          width: .infinity,
          height: 27,
          child: Row(
            mainAxisAlignment: .start,
            children: [
              Container(
                width: 20,
                padding: .all(3.8),

                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.red : AppColors.grey_2,
                    width: 1.25,
                  ),
                ),
                child: isSelected
                    ? Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.red,
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 10),
              Text(currentPrice, style: CustomTextstyle.bold400Text14),
            ],
          ),
        ),
      ),
    );
  }
}

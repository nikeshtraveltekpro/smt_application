import 'package:flutter/material.dart';
import 'package:smt_application/generated/assets.dart';
import 'package:smt_application/src/modules/home/models/home_hotel_deal_model.dart';
import 'package:smt_application/utils/common_asset_image.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/app_constants.dart';
import 'package:smt_application/utils/app_sizes.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class BestDealCard extends StatelessWidget {
  const new({super.key, required this.item});
  final HomeHotelDealModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 229,
        height: 205,

        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    height: 110,
                    width: double.infinity,
                    item.image ?? " ",
                    fit: .cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 10,
                  child: Container(
                    height: 18,
                    width: 42,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CommonAssetImage(
                          image: Assets.star,
                          height: 6,
                          width: 6,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          "${item.rating}",
                          style: CustomTextstyle.normalText9,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s8),
            Text(item.title ?? " ", style: CustomTextstyle.boldText14Blue),
            const SizedBox(height: 3),
            Row(
              children: [
                const CommonAssetImage(image: Assets.location, height: 12, width: 12),
                const SizedBox(width: 5),
                Text(
                  item.location ?? " ",
                  style: CustomTextstyle.normal400Text12,
                ),
                const SizedBox(width: 5),
                Container(
                  height: 2,
                  width: 2,
                  decoration: const BoxDecoration(
                    color: AppColors.grey2,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "${item.review} reviews",
                  style: CustomTextstyle.normal400Text12,
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Row(
                  children: [
                    Text(
                      item.price ?? " ",
                      style: CustomTextstyle.boldText14Blue,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      AppConstants.nights,
                      style: CustomTextstyle.normal400Text8,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "+₹${item.taxAmount} taxes",
                  style: CustomTextstyle.normal400Text12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

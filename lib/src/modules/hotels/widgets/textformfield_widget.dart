import 'package:flutter/material.dart';
import 'package:smt_application/src/modules/hotels/widgets/hotel_constants.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: HotelConstants.searchByCityAndProperty,
        hintStyle: CustomTextstyle.normal400Text12,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(52)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(52),
          borderSide: BorderSide(
            color: AppColors.grey2.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(52),
          borderSide: BorderSide(color: AppColors.textIconBlue),
        ),
      ),
    );
  }
}

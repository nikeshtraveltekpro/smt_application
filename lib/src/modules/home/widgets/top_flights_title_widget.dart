import 'package:flutter/material.dart';
import 'package:smt_application/utils/app_constants.dart';
import 'package:smt_application/utils/custom_textstyle.dart';
class TopFlightsTitleWidets extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Text(AppConstants.topFlights, style: CustomTextstyle.boldText16),
        ],
      ),
    );
  }
}

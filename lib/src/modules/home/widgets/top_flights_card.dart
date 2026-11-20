import 'package:flutter/material.dart';
import 'package:smt_application/src/modules/home/models/home_top_flights_model.dart';
import 'package:smt_application/utils/app_colors.dart';
import 'package:smt_application/utils/custom_textstyle.dart';

class TopFlightsCard extends StatelessWidget {
  const new({super.key, required this.topFlight});

  final HomeTopFlightsModel topFlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 182,
      width: 168,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: .circular(16),

        border: Border.all(width: 3, color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyBgShadow.withValues(alpha: 0.1),
            offset: Offset(1, 1.97),
            blurRadius: 2,

            spreadRadius: 3,
          ),
          BoxShadow(
            color: AppColors.greyBgShadow.withValues(alpha: 0.2),
            offset: Offset(-1, -1.97),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: .circular(16),
                  child: Image.network(
                    topFlight.image,
                    fit: .cover,
                    height: 174,
                    width: 168,
                  ),
                ),
              ),
              Positioned(
                top: 134,
                left: 12,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      topFlight.title,
                      style: CustomTextstyle.topFlightTitleWhite,
                    ),
                    Text(
                      topFlight.subtitle,
                      style: CustomTextstyle.topFlightSubtitleWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

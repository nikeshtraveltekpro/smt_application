import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CommonAssetImage extends StatelessWidget {
  const CommonAssetImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
  });

  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }
}

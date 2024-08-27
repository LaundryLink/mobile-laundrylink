import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButtons extends StatelessWidget {
  const CustomIconButtons({
    super.key,
    required this.onTap,
    required this.pathIcon,
    this.width,
    this.height
  }) ;

  final VoidCallback onTap;
  final String pathIcon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
            pathIcon, width: width != null ? width : null, height: height != null ? height : null,));
  }
}
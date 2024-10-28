import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key, required this.pathIcon, this.width, this.height, this.color});

  final String pathIcon;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      pathIcon,
      width: width != null ? width : null,
      height: height != null ? height : null,
    );
  }
}

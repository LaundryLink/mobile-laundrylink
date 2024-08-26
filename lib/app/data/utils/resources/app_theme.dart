// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resources {
  static _AppColors color = _AppColors();
  static _AppTextStyle textStyle = _AppTextStyle();
  static _AppStaticString staticString = _AppStaticString();
}

class _AppColors {
  Color primaryColor = const Color(0xFF0A4171);
  Color secondaryColor = const Color(0xFF2E6EB6);
  Color primaryColorDisable = const Color(0xFF2196EE);
  Color gradientColor = const Color(0xFF1A91F8);
  Color textButtonPrimary = const Color(0xFF2E6EB6);
  Color textButtonSecondary = const Color(0xFFFFFFFF);
}

class _AppTextStyle {
  TextStyle subTitle1 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}

class _AppStaticString {
  String api_web = "http://localhost:3001/";
  String api_mobile = "http://10.0.2.2:3001/";
}

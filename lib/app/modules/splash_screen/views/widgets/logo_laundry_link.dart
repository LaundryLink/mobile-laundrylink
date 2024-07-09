import 'package:flutter/material.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';

class LogoLaundryLink extends StatelessWidget {
  const LogoLaundryLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Resources.color.primaryColor, Resources.color.gradientColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
          child: Image.asset(
        'assets/images/logo_laundry_link.png',
        width: 222,
        height: 222,
      )),
    );
  }
}

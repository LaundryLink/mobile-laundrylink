import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/modules/widgets/custom_active_button.dart';

import '../../../../data/utils/resources/app_theme.dart';
import '../../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';

class SigninFormView extends StatelessWidget {
  const SigninFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/svg/auth_circle.svg',
                fit: BoxFit.cover,
                width: Get.width,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Transform.translate(
                    offset: Offset(0, 69), // Shift left and move up
                    child: Image.asset(
                      'assets/images/logo_laundry_link.png',
                      height: 222,
                      width: 222,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Container(
            width: Get.width * 0.9,
            alignment: Alignment.centerLeft,
            child: Text(
              "Email",
              style: Resources.textStyle.subTitle1,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "youremail@mail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Container(
            width: Get.width * 0.9,
            alignment: Alignment.centerLeft,
            child: Text(
              "Password",
              style: Resources.textStyle.subTitle1,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "your password",
            keyboardType: TextInputType.visiblePassword,
            iconVisible: Icons.visibility_off_outlined,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          SizedBox(
            width: Get.width * 0.9,
            child: GestureDetector(
              onTap: () {
                debugPrint("Forgot Password Button");
              },
              child: Text(
                "Forgot  Password",
                style: TextStyle(
                    color: Resources.color.textButtonPrimary, fontSize: 12),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          CustomActiveButton(buttonText: "Login", onTap: () {}),
          SizedBox(
            height: Get.height * 0.03,
          ),
          SizedBox(
            width: Get.width,
            child: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.SIGNUP);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Not have an account? ',
                        style: TextStyle(
                            color: Resources.color.textButtonPrimary)),
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            color: Resources.color.textButtonPrimary,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

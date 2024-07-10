import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/modules/widgets/custom_active_button.dart';
import 'package:laundry_link/app/modules/widgets/custom_app_bar.dart';
import 'package:laundry_link/app/modules/widgets/custom_text_field.dart';

import '../../../../routes/app_pages.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Resources.color.textButtonSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(
            title: "Create Your Account",
            onPressed: () {
              debugPrint("Button back");
            },
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          Container(
            width: Get.width * 0.9,
            alignment: Alignment.centerLeft,
            child: Text(
              "Full Name",
              style: Resources.textStyle.subTitle1,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "laundry link",
            keyboardType: TextInputType.name,
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
            hintText: "yourmail@mail.com",
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Container(
            width: Get.width * 0.9,
            alignment: Alignment.centerLeft,
            child: Text(
              "Phone Number",
              style: Resources.textStyle.subTitle1,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "08xxxxxxxxx",
            keyboardType: TextInputType.phone,
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
            height: Get.height * 0.09,
          ),
          CustomActiveButton(buttonText: "Create", onTap: () {}),
          SizedBox(
            height: Get.height * 0.03,
          ),
          SizedBox(
            width: Get.width,
            child: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.SIGNINFORM);
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Already have account? ',
                        style: TextStyle(
                            color: Resources.color.textButtonPrimary)),
                    TextSpan(
                        text: 'Login',
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

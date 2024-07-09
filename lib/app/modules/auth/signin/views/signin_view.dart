import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/data/utils/resources/app_theme.dart';
import 'package:laundry_link/app/modules/widgets/custom_active_button.dart';
import 'package:laundry_link/app/routes/app_pages.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            height: Get.height * 0.036,
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: Get.height * 0.02,
            children: [
              CustomActiveButton(
                  buttonText: "Login",
                  onTap: () {
                    Get.toNamed(Routes.SIGNINFORM);
                    debugPrint("Login Button");
                  }),
              GestureDetector(
                onTap: () {
                  print('Register Button');
                  Get.toNamed(Routes.SIGNUP);
                },
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height % 56,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF2196EE), width: 2),
                    color: Color(0x332196EE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Resources.color.textButtonPrimary,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          SizedBox(
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                Text("Or login with"),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(right: 8.0),
                      width: Get.width / 3,
                      child: Divider(
                        color: Color(0xFF828282),
                        thickness: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              debugPrint("Login with google button");
            },
            child: Container(
              alignment: Alignment.center,
              height: Get.height * 0.056,
              width: Get.width * 0.61,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color(0xFF2B7CD6)),
              child: Wrap(
                spacing: 20,
                direction: Axis.horizontal,
                children: [
                  SvgPicture.asset('assets/icons/login_gmail.svg'),
                  Text(
                    "Login with Google",
                    style:
                        TextStyle(color: Resources.color.textButtonSecondary),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

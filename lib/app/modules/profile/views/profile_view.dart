import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laundry_link/app/modules/profile/controllers/profile_controller.dart';
import 'package:laundry_link/app/routes/app_pages.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBarProfile(controller: controller),
        SizedBox(
          height: Get.height * 0.085,
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person_outline_outlined),
                  SizedBox(width: Get.width * 0.03),
                  Text("Edit Profile")
                ]),
          ),
        ),
        Divider(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.help_outline_outlined),
                  SizedBox(width: Get.width * 0.03),
                  Text("Bantuan")
                ]),
          ),
        ),
        Divider(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Container(
          width: Get.width,
          margin: EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              controller.logoutUser();
              Get.offAllNamed(Routes.SPLASH);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.logout_outlined),
                  SizedBox(width: Get.width * 0.03),
                  Text("Keluar")
                ]),
          ),
        )
      ],
    ));
  }
}

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svg/profile_wave.svg',
          fit: BoxFit.cover,
          width: Get.width,
        ),
        Positioned(
          bottom: AppBar().preferredSize.height - 25,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            width: Get.width,
            child: Row(
              children: [
                CircleAvatar(backgroundImage:AssetImage("assets/images/blank_picture.png",), 
                  radius: 30,
                ),
                SizedBox(
                  width: Get.width * 0.04,
                ),
                Text(
                  controller.user.fullName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Adjust color as needed
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

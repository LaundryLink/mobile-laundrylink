import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/controllers/profile_controller.dart';
import '../../widgets/custom_icons.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({
    super.key,
    required ProfileController profileController,
  }) : _profileController = profileController;

  final ProfileController _profileController;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xA6D9D9D9),
        ),
        width: Get.width * 0.432,
        height: Get.height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(
              pathIcon:
                  'assets/svg/card_business_icon.svg',
              height: 19,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (_profileController
                      .isLoading.value) {
                    return Center(
                      child:
                          CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFFCC19),
                          borderRadius:
                              BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color:
                                    Color(0X40000000),
                                blurRadius: 4)
                          ]),
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        _profileController
                            .user.membershipStatus,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                                FontWeight.w500),
                      ),
                    );
                  }
                }),
                Text(
                  "Membership",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                )
              ],
            )
          ],
        ));
  }
}
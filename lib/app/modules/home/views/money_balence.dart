import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/under_construction_controller.dart';
import '../../../data/utils/resources/app_theme.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../widgets/custom_icons.dart';

class MoneyBalence extends StatelessWidget {
  const MoneyBalence({
    super.key,
    required ProfileController profileController,
    required UnderConstructionController constructionController,
  })  : _profileController = profileController,
        _constructionController = constructionController;

  final ProfileController _profileController;
  final UnderConstructionController _constructionController;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xA6D9D9D9),
        ),
        width: Get.width * 0.433,
        height: Get.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomIcon(
                pathIcon: 'assets/svg/wallet_icon.svg',
                width: 32,
              ),
            ),
            Obx(() {
              if (_profileController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rp.${_profileController.user.eMoneyBalence}.000',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () => _constructionController.message(),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.add,
                              size: 12,
                              color: Resources.color.textButtonPrimary,
                            ),
                            SizedBox(
                              width: Get.width * 0.008,
                            ),
                            Text(
                              "Top-Up",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Resources.color.textButtonPrimary),
                            )
                          ],
                        ),
                      )
                    ]);
              }
            })
          ],
        ));
  }
}

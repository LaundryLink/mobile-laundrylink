import 'package:flutter/material.dart';

import '../../../data/utils/resources/app_theme.dart';
import '../../../controllers/under_construction_controller.dart';
import '../../widgets/custom_icon_buttons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required UnderConstructionController constructionController,
  }) : _constructionController = constructionController;

  final UnderConstructionController _constructionController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(direction: Axis.vertical, children: [
          Text(
            "Lokasi Kamu",
            style: TextStyle(
                color: Resources.color.textButtonSecondary,
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
          GestureDetector(
              onTap: () => _constructionController.message(),
              child: Wrap(
                children: [
                  Text(
                    "Tlogomas",
                    style: TextStyle(
                        color:
                            Resources.color.textButtonSecondary),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Resources.color.textButtonSecondary,
                  )
                ],
              ))
        ]),
        Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            direction: Axis.horizontal,
            children: [
              CustomIconButtons(onTap: ()=> _constructionController.message(), pathIcon: 'assets/svg/notif_icon.svg', width: 24, height: 24),
              CustomIconButtons(onTap: () => _constructionController.message(), pathIcon: 'assets/svg/chat_bubble_icon.svg', width: 24, height: 24)
            ])
      ],
    );
  }
}
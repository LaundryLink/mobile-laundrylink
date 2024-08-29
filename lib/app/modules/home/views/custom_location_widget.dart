import 'package:flutter/material.dart';

import '../../../controllers/under_construction_controller.dart';
import '../../../data/utils/resources/app_theme.dart';

class CustomLocationWidget extends StatelessWidget {
  const CustomLocationWidget({
    super.key,
    required UnderConstructionController constructionController,
  }) : _constructionController = constructionController;

  final UnderConstructionController _constructionController;

  @override
  Widget build(BuildContext context) {
    return Wrap(direction: Axis.vertical, children: [
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
    ]);
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/utils/resources/app_theme.dart';

class UnderConstructionView extends StatelessWidget {
  const UnderConstructionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 4, backgroundColor: Resources.color.secondaryColor,
        title: Text('Unavailable'),leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/construction.png'),
          Text("Oopss, sorry this features still under construction")
        ],
      ),
    );
  }
}

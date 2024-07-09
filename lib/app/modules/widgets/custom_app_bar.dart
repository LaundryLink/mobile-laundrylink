import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  CustomAppBar({required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SvgPicture.asset(
          'assets/svg/appbar_shape.svg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: AppBar().preferredSize.height - 15,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 40),
                    width: MediaQuery.of(context).size.width / 3,
                    child: IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white, // Adjust color as needed
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Text(
                  title,
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

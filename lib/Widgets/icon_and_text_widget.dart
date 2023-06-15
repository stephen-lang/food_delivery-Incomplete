import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/SmallText.dart';
import 'package:food_delivery/utils/Colors.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icons;
  final String text;
  final Color iconColor;
  final double size;
  const IconTextWidget(
      {Key? key,
      required this.iconColor,
      required this.icons,
      this.size = 5,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          color: iconColor,
          icons,
        ),
        const SizedBox(
          width: 5,
          height: 0,
        ),
        SmallText(
          text: text,
          textOverflow: TextOverflow.visible,
          size: size,
        )
      ],
    );
  }
}

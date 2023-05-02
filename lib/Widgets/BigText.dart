// ignore_for_file: file_names

import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  Color? colors;
  final int size;
  final TextOverflow textOverflow;

  BigText(
      {Key? key,
      required this.text,
      this.colors = const Color(0XFF332d2b),
      required this.size,
      required this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        color: colors,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto-Bold',
      ),
    );
  }
}

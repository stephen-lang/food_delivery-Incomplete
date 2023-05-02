import 'package:flutter/material.dart';
import 'package:food_delivery/Widgets/BigText.dart';
import 'package:food_delivery/Widgets/SmallText.dart';

import 'package:food_delivery/utils/Colors.dart';

class MainfoodPage extends StatefulWidget {
  const MainfoodPage({Key? key}) : super(key: key);

  @override
  State<MainfoodPage> createState() => _MainfoodPageState();
}

class _MainfoodPageState extends State<MainfoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                        text: 'Bangladesh',
                        colors: AppColors.mainColor,
                        size: 50,
                        textOverflow: TextOverflow.ellipsis),
                    Row(
                      children: [
                        SmallText(
                            text: 'Accra',
                            size: 50,
                            textOverflow: TextOverflow.ellipsis),
                        const Icon(
                          IconData(0xe098, fontFamily: 'MaterialIcons'),
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

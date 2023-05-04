import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: index.isEven ? Colors.brown : Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

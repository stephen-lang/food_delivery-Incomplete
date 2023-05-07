import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 300,
      child: PageView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(children: [
      Container(
        alignment: AlignmentDirectional.bottomEnd,
        height: 180,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.brown : Colors.red,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      Container(
        height: 180,
        margin: const EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.brown : Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ]);
  }
}

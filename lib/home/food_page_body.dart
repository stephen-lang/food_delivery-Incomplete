import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/Widgets/BigText.dart';

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
        height: 180,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.red,
          image: const DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/image/food1.jpg")),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      Container(
        alignment: AlignmentDirectional.bottomEnd,
        height: 140,
        width: 300,
        margin: const EdgeInsets.only(left: 60, right: 40, top: 140),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            BigText(
                text: "Bitter Orange Marinade",
                size: 50,
                textOverflow: TextOverflow.visible),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  itemSize: 15,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
            Row(),
          ],
        ),
      ),
    ]);
  }
}

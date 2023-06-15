import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/Widgets/BigText.dart';
import 'package:food_delivery/Widgets/SmallText.dart';
import 'package:food_delivery/Widgets/icon_and_text_widget.dart';
import 'package:food_delivery/utils/Colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  double _scaleFactor = 0.8;
  var Current_Page = 0.0;
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  void initState() {
    super.initState();
    pageController.addListener(
      () {
        setState(() {
          Current_Page = pageController.page!;
          print(
              "the current page number is  ${Current_Page.floor().toString()}");
        });
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: Current_Page.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 25,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BigText(
                text: 'Popular',
                textOverflow: TextOverflow.visible,
                colors: Colors.black,
              ),
              const SizedBox(
                width: 30,
                height: 15,
              ),
              SmallText(
                  text: "Faood Pairing",
                  size: 10,
                  textOverflow: TextOverflow.visible),
            ],
          ),
        ),
        ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: 300,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 0, top: 50),
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/food1.jpg")),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == Current_Page.floor()) {
      var currentScale = 1 - (Current_Page - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    } else if (index == Current_Page.floor() + 1) {
      var currentScale =
          _scaleFactor + (Current_Page - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 180,
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.red,
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/image/food1.jpg")),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
            height: 140,
            width: 300,
            margin: const EdgeInsets.only(left: 50, right: 40, top: 130),
            decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,

                  blurRadius: 5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),

                  blurRadius: 5,
                  offset: const Offset(-5, 0), // changes position of shadow
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),

                  blurRadius: 5,
                  offset: const Offset(5, 0), // changes position of shadow
                ),
              ],
              color: index.isEven ? Colors.white : Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: BigText(
                        text: "Bitter Orange Marinade",
                        size: 20,
                        textOverflow: TextOverflow.visible)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 5,
                      itemSize: 15,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    SmallText(
                        text: '4.5',
                        size: 12,
                        textOverflow: TextOverflow.visible),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    SmallText(
                        text: '1278',
                        size: 12,
                        textOverflow: TextOverflow.visible),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    SmallText(
                        text: 'comment',
                        size: 12,
                        textOverflow: TextOverflow.visible)
                  ],
                ),
                const SizedBox(
                  width: 20,
                  height: 30,
                ),
                Row(
                  children: [
                    IconTextWidget(
                      iconColor: AppColors.iconColor1,
                      icons: Icons.circle_sharp,
                      text: "Normal",
                      size: 12,
                    ),
                    IconTextWidget(
                      iconColor: AppColors.mainColor,
                      icons: Icons.location_on,
                      text: '1.7km',
                      size: 12,
                    ),
                    IconTextWidget(
                        iconColor: AppColors.iconColor1,
                        icons: Icons.access_time_rounded,
                        size: 12,
                        text: '25m')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

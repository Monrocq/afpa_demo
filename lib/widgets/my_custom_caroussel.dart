import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCustomCaroussel extends StatelessWidget {
  CarouselController carouselController;
  MyCustomCaroussel({Key? key, required this.carouselController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        return CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: NeverScrollableScrollPhysics(),
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((uri) => Container(
                      child: Center(
                          child: Image.asset(
                        uri,
                        fit: BoxFit.cover,
                        height: height,
                      )),
                    ))
                .toList());
      },
    );
  }

  List<String> imgList = [
    "lib/assets/foot1.jpg",
    "lib/assets/foot2.jpg",
    "lib/assets/foot3.jpg",
    "lib/assets/foot4.jpg",
    "lib/assets/foot5.jpg"
  ];
}

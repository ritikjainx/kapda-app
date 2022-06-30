import 'package:flutter/material.dart';
import '../../../Constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String image;
  const SplashContent({this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'Kapda',
          style:
              TextStyle(color: kPrimaryColor, fontSize: getProportionateScreenHeight(36), fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}

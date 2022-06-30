import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;

  const CustomAppBar({this.rating});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: appBarIcon(
                    context: context,
                    onpress: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_ios)),
            Container(
              margin: const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              // height: getProportionateScreenHeight(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Text(
                    '$rating',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    'assets/icons/Star Icon.svg',
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container appBarIcon({BuildContext context, IconData icon, Function onpress}) {
    return Container(
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: InkWell(
        onTap: onpress,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}

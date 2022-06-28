import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapda/Screens/CartScreen/CartScreen.dart';
import 'package:kapda/Screens/HomeScreen/homeScreen.dart';
import 'package:kapda/Screens/products_screen.dart';
import 'package:kapda/Screens/profile/profile.dart';
import 'package:kapda/sizeConfig.dart';
import '../Menustate.dart';
import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  final selected;

  const BottomNavBar({Key key, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: const Color(0xffdadada).withOpacity(0.25), offset: const Offset(0, -15), blurRadius: 20),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Shop Icon.svg',
                  width: getProportionateScreenWidth(30),
                  color: selected == MenuState.homepage ? kPrimaryColor : kTextColor.withOpacity(0.6),
                ),
                onPressed: () {
                  if (ModalRoute.of(context).settings.name != HomeScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                  }
                }),
            IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Heart Icon.svg',
                  width: getProportionateScreenWidth(30),
                  color: selected == MenuState.favourite ? kPrimaryColor : kTextColor.withOpacity(0.6),
                ),
                onPressed: () {
                  if (ModalRoute.of(context).settings.name != ProductsScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(context, ProductsScreen.routeName, (route) => false);
                  }
                }),
            IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Cart Icon.svg',
                  width: getProportionateScreenWidth(30),
                  color: selected == MenuState.cart ? kPrimaryColor : kTextColor.withOpacity(0.6),
                ),
                onPressed: () {
                  if (ModalRoute.of(context).settings.name != CartScreen.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, CartScreen.routeName, ModalRoute.withName(HomeScreen.routeName));
                  }
                }),
            IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/User Icon.svg',
                  width: getProportionateScreenWidth(30),
                  color: selected == MenuState.profile ? kPrimaryColor : kTextColor.withOpacity(0.6),
                ),
                onPressed: () {
                  if (ModalRoute.of(context).settings.name != Profile.routeName) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Profile.routeName, ModalRoute.withName(HomeScreen.routeName));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

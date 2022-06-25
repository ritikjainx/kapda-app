import 'package:flutter/material.dart';
import 'package:kapda/sizeConfig.dart';
import '../Screens/ProfilePage/profilePage.dart';
import '../constants.dart';

class NoAccountSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account ? ',
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProfilePage.routeName);
          },
          child: Text(
            'Sign UP',
            style: TextStyle(color: kPrimaryColor, fontSize: getProportionateScreenWidth(16)),
          ),
        )
      ],
    );
  }
}

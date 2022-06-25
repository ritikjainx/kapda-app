import 'package:flutter/material.dart';
import 'package:kapda/Screens/Forget_Screen/forgetscreen.dart';
import 'package:kapda/components/NoaccountSignup.dart';
import 'package:kapda/components/socialMedia.dart';
import 'package:kapda/constants.dart';
import 'package:kapda/sizeConfig.dart';

import 'SignForm.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: getProportionateScreenHeight(40),
          ),
          Text(
            'Welcome',
            style:
                TextStyle(color: Colors.black, fontSize: getProportionateScreenWidth(30), fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Text(
            'Sign in with your registered mobile number ',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getProportionateScreenHeight(80),
          ),
          SignForm(),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (checkvalue) {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                },
                activeColor: kPrimaryColor,
              ),
              Text('Remember Me'),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          NoAccountSignup()
        ],
      ),
    );
  }
}

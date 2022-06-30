import 'package:flutter/material.dart';
import 'package:kapda/components/NoaccountSignup.dart';
import 'package:kapda/constants.dart';
import 'package:kapda/services/shared_prefs.dart';
import 'package:kapda/size_config.dart';

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(150),
            ),
            Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.black, fontSize: getProportionateScreenWidth(30), fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const Text(
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
                  onChanged: (checkvalue) async {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                    await UserSharedPrefs.setToRemember(rememberMe);
                  },
                  activeColor: kPrimaryColor,
                ),
                const Text('Remember Me'),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            NoAccountSignup()
          ],
        ),
      ),
    );
  }
}

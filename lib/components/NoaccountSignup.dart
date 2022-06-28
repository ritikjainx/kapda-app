import 'package:flutter/material.dart';
import 'package:kapda/services/auth_provider.dart';
import 'package:kapda/sizeConfig.dart';
import 'package:provider/provider.dart';
import '../Screens/CreateProfilePage/create_profile_page.dart';
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
            Provider.of<AuthProvider>(context, listen: false).updateErrorText('');
            Navigator.pushNamed(context, CreateProfilePage.routeName);
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

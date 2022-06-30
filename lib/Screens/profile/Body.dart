import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapda/Screens/LoginPage/loginPage.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/constants.dart';
import 'package:kapda/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(h: 25),
          // ListOptions(svgicon: 'assets/icons/User Icon.svg', text: 'My Account'),
          ListOptions(
            svgicon: 'assets/icons/Log out.svg',
            text: 'Log Out',
            onpress: () async{
             await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(context, LoginPage.routename, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

class ListOptions extends StatelessWidget {
  final String text;
  final String svgicon;
  final Function() onpress;

  const ListOptions({Key key, this.text, this.svgicon, this.onpress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(8),
            horizontal: getProportionateScreenWidth(20),
          ),
          tileColor: const Color(0xfff5f6f9),
          leading: SvgPicture.asset(
            svgicon,
            color: kPrimaryColor,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: getProportionateScreenHeight(18)),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onpress,
        ),
      ),
    );
  }
}

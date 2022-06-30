import 'package:flutter/material.dart';
import 'package:kapda/Screens/splash/components/body.dart';
import 'package:kapda/size_config.dart';

class SplashScreen extends StatelessWidget {
  static const routename = 'splashscreen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

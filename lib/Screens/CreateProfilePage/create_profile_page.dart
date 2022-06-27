import 'package:flutter/material.dart';
import '../../sizeConfig.dart';
import 'body.dart';

class CreateProfilePage extends StatelessWidget {
  static const routeName = '/profilePage';
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}

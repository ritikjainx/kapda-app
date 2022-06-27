import 'package:flutter/material.dart';
import 'body.dart';

class CreateProfilePage extends StatelessWidget {
  static const routeName = '/profilePage';
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}

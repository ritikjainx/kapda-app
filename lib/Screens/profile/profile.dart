import 'package:flutter/material.dart';
import 'package:kapda/Menustate.dart';
import 'package:kapda/sizeConfig.dart';
import '../../components/BottomnavBar.dart';
import 'Body.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
      bottomNavigationBar: const BottomNavBar(
        selected: MenuState.profile,
      ),
    );
  }
}

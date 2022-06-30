import 'package:flutter/material.dart';
import 'package:kapda/menu_state.dart';
import 'package:kapda/size_config.dart';
import '../../components/bottomnavBar.dart';
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
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: const BottomNavBar(
        selected: MenuState.profile,
      ),
    );
  }
}

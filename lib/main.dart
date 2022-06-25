import 'package:flutter/material.dart';
import 'package:kapda/Routes.dart';
import 'package:kapda/Screens/splash/splashScreens.dart';
import 'package:kapda/services/cart_products.dart';
import 'package:kapda/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Needs',
        theme: themeData(),
        initialRoute: SplashScreen.routename,
        routes: routes,
      ),
    );
  }
}

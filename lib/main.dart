import 'package:flutter/material.dart';
import 'package:kapda/Routes.dart';
import 'package:kapda/Screens/CreateProfilePage/create_profile_page.dart';
import 'package:kapda/Screens/splash/splashScreens.dart';
import 'package:kapda/services/cart_products.dart';
import 'package:kapda/services/gsheets.dart';
import 'package:kapda/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetApi.init();
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
        // initialRoute: SplashScreen.routename,
        initialRoute: CreateProfilePage.routeName,
        routes: routes,
      ),
    );
  }
}

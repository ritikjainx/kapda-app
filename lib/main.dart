import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kapda/Routes.dart';
import 'package:kapda/Screens/CreateProfilePage/create_profile_page.dart';
import 'package:kapda/Screens/HomeScreen/homeScreen.dart';
import 'package:kapda/Screens/splash/splashScreens.dart';
import 'package:kapda/services/auth_provider.dart';
import 'package:kapda/services/cart_products.dart';
import 'package:kapda/services/gsheets.dart';
import 'package:kapda/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GSheetsApi.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProducts()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Needs',
          theme: themeData(),
          // initialRoute: SplashScreen.routename,
          // initialRoute: CreateProfilePage.routeName,
          initialRoute: HomeScreen.routeName,

          routes: routes,
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kapda/Routes.dart';
import 'package:kapda/Screens/HomeScreen/homeScreen.dart';
import 'package:kapda/services/auth_provider.dart';
import 'package:kapda/services/cart_products.dart';
import 'package:kapda/services/gsheets.dart';
import 'package:kapda/services/product_service.dart';
import 'package:kapda/services/shared_prefs.dart';
import 'package:kapda/theme.dart';
import 'package:provider/provider.dart';
import 'Screens/splash/splashScreens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GSheetsApi.init();
  await UserSharedPrefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProducts()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductsService()),
      ],
      builder: (context, child) {
        log('master init');
        bool toRemember = UserSharedPrefs.getToRemember();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Needs',
          theme: themeData(),
          home: toRemember != null
              ? (toRemember == true
                  ? StreamBuilder<User>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.active) {
                          if (snapshot.hasData) {
                            return HomeScreen();
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        } else if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SplashScreen();
                      },
                    )
                  : SplashScreen())
              : SplashScreen(),
          routes: routes,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kapda/Screens/CartScreen/CartScreen.dart';
import 'package:kapda/Screens/DetailsScreen.dart/Detailscreen.dart';
import 'package:kapda/Screens/Forget_Screen/forgetscreen.dart';
import 'package:kapda/Screens/HomeScreen/homeScreen.dart';
import 'package:kapda/Screens/LoginPage/loginPage.dart';
import 'package:kapda/Screens/OTP_Screen/OTPScreen.dart';
import 'package:kapda/Screens/products_screen.dart';
import 'package:kapda/Screens/profile/profile.dart';
import 'package:kapda/Screens/splash/splashScreens.dart';

import 'Screens/CreateProfilePage/create_profile_page.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routename: (context) => SplashScreen(),
  LoginPage.routename: (context) => LoginPage(),
  ForgetScreen.routeName: (context) => ForgetScreen(),
  OTPscreen.routeName: (context) => OTPscreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  Profile.routeName: (context) => Profile(),
  CreateProfilePage.routeName: (context) => CreateProfilePage(),
  ProductsScreen.routeName : (_)=> ProductsScreen(),
};

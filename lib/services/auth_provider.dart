import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kapda/Modals/ApiModels/user_modal.dart' as userModal;

import '../Screens/OTP_Screen/OTPScreen.dart';
import 'gsheets.dart';

class AuthProvider extends ChangeNotifier {
  String _phoneNumber;
  String errorText = '';
  String verificationid = '';
  final _auth = FirebaseAuth.instance;
  userModal.User user;

  String get phoneNumber => _phoneNumber;

  set updatePhoneNumber(String number) {
    _phoneNumber = number;
  }

  Future sendOtpToPhone({BuildContext context}) async {
    await _auth
        .verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // print(credential);
        // if (Platform.isAndroid) {
        //   await _auth.signInWithCredential(credential);
        // }
      },
      verificationFailed: (FirebaseAuthException e) {
        log("error aa gya h verification me");
        errorText = e.toString();
        notifyListeners();
      },
      codeSent: (String verificationId, int resendToken) {
        verificationid = verificationId;
        errorText = "";
        notifyListeners();
        Navigator.pushNamed(context, OTPscreen.routeName);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    )
        .onError((error, stackTrace) {
      log("error aa gya h send otp me");
      errorText = error.toString();
      notifyListeners();
    });
  }

  Future saveUserToDataBase() async {
    final userData = user.tojson();
    print(userData);
    await GSheetsApi.insert(userData);
  }
}

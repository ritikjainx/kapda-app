import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/constants.dart';
import 'package:kapda/services/auth_provider.dart';
import 'package:kapda/sizeConfig.dart';
import 'package:provider/provider.dart';

import '../../services/product_service.dart';
import '../HomeScreen/homeScreen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FocusNode focusnode2;
  FocusNode focusnode3;
  FocusNode focusnode4;
  FocusNode focusnode5;
  FocusNode focusnode6;
  final _otp1 = TextEditingController();
  final _otp2 = TextEditingController();
  final _otp3 = TextEditingController();
  final _otp4 = TextEditingController();
  final _otp5 = TextEditingController();
  final _otp6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusnode2 = FocusNode();
    focusnode3 = FocusNode();
    focusnode4 = FocusNode();
    focusnode5 = FocusNode();
    focusnode6 = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusnode2.dispose();
    focusnode3.dispose();
    focusnode4.dispose();
    focusnode5.dispose();
    focusnode6.dispose();
    _otp1.dispose();
    _otp2.dispose();
    _otp3.dispose();
    _otp4.dispose();
    _otp5.dispose();
    _otp6.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "OTP Verification",
                style: TextStyle(color: Colors.black, fontSize: getProportionateScreenHeight(30)),
              ),
              Text('Enter the OTP code Sent to to +91${authProvider.phoneNumber}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('the code will expire in '),
                  TweenAnimationBuilder(
                      tween: Tween(begin: 60.0, end: 0),
                      duration: const Duration(seconds: 60),
                      builder: (_, value, __) {
                        return Text(
                          '0:${value.toInt()}',
                          style: const TextStyle(color: kPrimaryColor),
                        );
                      }),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              otpBoxes(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              Defaultbutton(
                text: 'Continue',
                onpressed: () async {
                  String otpValue = _otp1.text + _otp2.text + _otp3.text + _otp4.text + _otp5.text + _otp6.text;
                  String verificationId = authProvider.verificationid;
                  try {
                    bool exist = await authProvider.checkUser();
                    final credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpValue);
                    final auth = await FirebaseAuth.instance.signInWithCredential(credential);
                    print(auth.user.uid);
                    if (!exist) {
                      await authProvider.saveUserToDataBase();
                    }
                    authProvider.updateErrorText("");
                    await Provider.of<ProductsService>(context, listen: false).getallProducts();

                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
                  } catch (e) {
                    authProvider.updateErrorText(e.toString());
                  }
                },
              ),
              const Gap(
                h: 10,
              ),
              if (authProvider.errorText.isNotEmpty)
                Text(
                  authProvider.errorText,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                  maxLines: 4,
                ),
              SizedBox(height: SizeConfig.screenHeight * 0.14),
              // Text(
              //   'Resend OTP Code',
              //   style: TextStyle(decoration: TextDecoration.underline),
              // ),
            ],
          ),
        ),
      );
    });
  }

  void shiftfocus(FocusNode focusNode, String value) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Row otpBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildSizedBox(
            textEditingController: _otp1,
            onchanged: (value) {
              shiftfocus(focusnode2, value);
            }),
        buildSizedBox(
            textEditingController: _otp2,
            focusNode: focusnode2,
            onchanged: (value) {
              shiftfocus(focusnode3, value);
            }),
        buildSizedBox(
            textEditingController: _otp3,
            focusNode: focusnode3,
            onchanged: (value) {
              shiftfocus(focusnode4, value);
            }),
        buildSizedBox(
            textEditingController: _otp4,
            focusNode: focusnode4,
            onchanged: (value) {
              shiftfocus(focusnode5, value);
            }),
        buildSizedBox(
            textEditingController: _otp5,
            focusNode: focusnode5,
            onchanged: (value) {
              shiftfocus(focusnode6, value);
            }),
        buildSizedBox(
            textEditingController: _otp6,
            focusNode: focusnode6,
            onchanged: (value) {
              focusnode4.unfocus();
            }),
      ],
    );
  }

  SizedBox buildSizedBox({Function onchanged, FocusNode focusNode, TextEditingController textEditingController}) {
    return SizedBox(
      width: getProportionateScreenWidth(40),
      child: TextField(
        controller: textEditingController,
        focusNode: focusNode,
        autofocus: true,
        obscureText: true,
        keyboardType: TextInputType.number,
        enabled: true,
        onChanged: onchanged,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 24),
        decoration: kOTPinputdecoration,
      ),
    );
  }
}

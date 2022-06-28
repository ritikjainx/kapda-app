import 'package:flutter/material.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/components/formStateErrors.dart';
import '../../../constants.dart';
import '../../../sizeConfig.dart';
import '../../OTP_Screen/OTPScreen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String phoneNumber;
  String password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          phoneNumberFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormStateError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Defaultbutton(
            text: 'Send OTP',
            onpressed: () {
              if (_formKey.currentState.validate() && errors.isEmpty) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, OTPscreen.routeName);
                // Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
        onSaved: (value) {
          phoneNumber = value;
          print(phoneNumber);
        },
        validator: (value) {
          if (value.isEmpty && !errors.contains(kPhoneNoNullEroor)) {
            errors.add(kPhoneNoNullEroor);
          } else if (value.length < 10 &&
              !errors.contains(kPhoneNoNullEroor) &&
              !errors.contains(kinvalidPhoneNoError)) {
            errors.add(kinvalidPhoneNoError);
          }
          setState(() {});
          return null;
        },
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPhoneNoNullEroor)) {
            errors.remove(kPhoneNoNullEroor);
          } else if (value.length == 10 && errors.contains(kinvalidPhoneNoError)) {
            errors.remove(kinvalidPhoneNoError);
          }
          setState(() {});
          return null;
        },
        keyboardType: TextInputType.phone,
        maxLength: 10,
        decoration: const InputDecoration(
          hintText: 'Enter your phone number',
          labelText: 'Phone number',
        ));
  }
}

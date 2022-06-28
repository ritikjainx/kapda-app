import 'package:flutter/material.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/components/formStateErrors.dart';
import 'package:provider/provider.dart';
import '../../../components/Gap.dart';
import '../../../constants.dart';
import '../../../services/auth_provider.dart';
import '../../../sizeConfig.dart';
import '../../OTP_Screen/OTPScreen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneEditingController = TextEditingController();
  List<String> errors = [];
  String phoneNumber;
  String password;

  @override
  void dispose() {
    super.dispose();
    _phoneEditingController.dispose();
  }

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
            onpressed: () async {
              if (_formKey.currentState.validate() && errors.isEmpty) {
                _formKey.currentState.save();
                Provider.of<AuthProvider>(context, listen: false).updatePhoneNumber = _phoneEditingController.text;
                bool exist = await Provider.of<AuthProvider>(context, listen: false).checkUser();
                if (exist) {
                  await Provider.of<AuthProvider>(context, listen: false).sendOtpToPhone(context: context);
                }
              }
            },
          ),
          const Gap(
            h: 10,
          ),
          if (Provider.of<AuthProvider>(context).errorText.isNotEmpty)
            Text(
              Provider.of<AuthProvider>(context).errorText,
              style: const TextStyle(color: Colors.red, fontSize: 12),
              maxLines: 4,
            )
        ],
      ),
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
        controller: _phoneEditingController,
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

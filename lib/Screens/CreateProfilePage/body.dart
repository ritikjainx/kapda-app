import 'package:flutter/material.dart';
import 'package:kapda/components/CustomsvgImage.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/modals/ApiModels/user_modal.dart';
import 'package:kapda/services/auth_provider.dart';
import 'package:kapda/size_config.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../Constants.dart';
import '../../services/shared_prefs.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Register account',
                style: TextStyle(
                    color: Colors.black, fontSize: getProportionateScreenHeight(30), fontWeight: FontWeight.bold)),
            const Gap(h: 20),
            const Text(
              'create your profile by providing few details',
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            const Gap(h: 40),
            Details(),
          ],
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formkey = GlobalKey<FormState>();
  final _firstNameEditingController = TextEditingController();
  final _lastNameEditingController = TextEditingController();
  final _addressEditingController = TextEditingController();
  final _phoneNumberEditingController = TextEditingController();
  bool rememberMe;

  @override
  void initState() {
    super.initState();
    rememberMe = UserSharedPrefs.getToRemember() ?? false;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameEditingController.dispose();
    _lastNameEditingController.dispose();
    _addressEditingController.dispose();
    _phoneNumberEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameEditingController,
            decoration: const InputDecoration(
                labelText: 'First Name',
                hintText: 'Enter your First Name',
                suffixIcon: SvgImage('assets/icons/User.svg')),
            validator: (value) {
              if (value.isEmpty) {
                return 'this field can\'t be empty';
              }
            },
          ),
          const Gap(h: 30),
          TextFormField(
            controller: _lastNameEditingController,
            decoration: const InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter your Last Name',
                suffixIcon: SvgImage('assets/icons/User.svg')),
            validator: (value) {
              if (value.isEmpty) {
                return 'this field can\'t be empty';
              }
            },
          ),
          const Gap(h: 30),
          TextFormField(
            controller: _addressEditingController,
            decoration: const InputDecoration(
              labelText: 'Address',
              hintText: 'Enter your address',
              suffixIcon: SvgImage('assets/icons/Discover.svg'),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'this field can\'t be empty';
              }
            },
          ),
          const Gap(h: 30),
          TextFormField(
            controller: _phoneNumberEditingController,
            decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                suffixIcon: SvgImage('assets/icons/Call.svg')),
            maxLength: 10,
            validator: (value) {
              if (value.isEmpty) {
                return 'this field can\'t be empty';
              } else if (value.length != 10) {
                return 'invalid phone Number';
              }
            },
          ),
          const Gap(h: 30),
          Defaultbutton(
            text: 'Create Profile',
            onpressed: () async {
              if (_formkey.currentState.validate()) {
                Provider.of<AuthProvider>(context, listen: false).updatePhoneNumber =
                    _phoneNumberEditingController.text;
                await Provider.of<AuthProvider>(context, listen: false).sendOtpToPhone(context: context);

                var uuid = const Uuid();
                String uid = uuid.v4();
                final user = UserData(
                  id: uid,
                  firstName: _firstNameEditingController.text,
                  lastName: _lastNameEditingController.text,
                  address: _addressEditingController.text,
                  phoneNumber: _phoneNumberEditingController.text,
                  favItems: [],
                );
                Provider.of<AuthProvider>(context, listen: false).user = user;
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
            ),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (checkvalue) async {
                  setState(() {
                    rememberMe = !rememberMe;
                  });
                  await UserSharedPrefs.setToRemember(rememberMe);
                },
                activeColor: kPrimaryColor,
              ),
              const Text('Remember Me'),
            ],
          ),
        ],
      ),
    );
  }
}

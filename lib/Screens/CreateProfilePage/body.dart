import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kapda/Modals/ApiModels/user_modal.dart' as userModal;
import 'package:kapda/components/CustomsvgImage.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/services/auth_provider.dart';
import 'package:kapda/services/gsheets.dart';
import 'package:kapda/sizeConfig.dart';
import 'package:provider/provider.dart';

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
            Gap(h: 20),
            Text(
              'create your profile by providing few details',
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            Gap(h: 40),
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
            decoration: InputDecoration(
                labelText: 'First Name',
                hintText: 'Enter your First Name',
                suffixIcon: SvgImage('assets/icons/User.svg')),
            validator: (value) {
              if (value.isEmpty) {
                return 'this field can\'t be empty';
              }
            },
          ),
          Gap(h: 30),
          TextFormField(
            controller: _lastNameEditingController,
            decoration: InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter your Last Name',
                suffixIcon: SvgImage('assets/icons/User.svg')),
            validator: (value) {
              if (value.isEmpty) {
                return 'this field can\'t be empty';
              }
            },
          ),
          Gap(h: 30),
          TextFormField(
            controller: _addressEditingController,
            decoration: InputDecoration(
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
          Gap(h: 30),
          TextFormField(
            controller: _phoneNumberEditingController,
            decoration: InputDecoration(
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
          Gap(h: 30),
          Defaultbutton(
            text: 'Create Profile',
            onpressed: () async {
              if (_formkey.currentState.validate()) {
                Provider.of<AuthProvider>(context, listen: false).updatePhoneNumber =
                    _phoneNumberEditingController.text;
                await Provider.of<AuthProvider>(context, listen: false).sendOtpToPhone(context: context);

                final user = userModal.User(
                  id: FirebaseAuth.instance.currentUser.uid,
                  firstName: _firstNameEditingController.text,
                  lastName: _lastNameEditingController.text,
                  address: _addressEditingController.text,
                  phoneNumber: _phoneNumberEditingController.text,
                );
                Provider.of<AuthProvider>(context,listen: false).user = user;
              }
            },
          ),
          Gap(
            h: 10,
          ),
          if (Provider.of<AuthProvider>(context).errorText.isNotEmpty)
            Text(
              Provider.of<AuthProvider>(context).errorText,
              style: TextStyle(color: Colors.red, fontSize: 12),
              maxLines: 4,
            )
        ],
      ),
    );
  }
}

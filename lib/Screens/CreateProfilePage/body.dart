import 'package:flutter/material.dart';
import 'package:kapda/Screens/OTP_Screen/OTPScreen.dart';
import 'package:kapda/components/CustomsvgImage.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/sizeConfig.dart';

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
  final Key _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: 'First Name',
                hintText: 'Enter your First Name',
                suffixIcon: SvgImage('assets/icons/User.svg')),
          ),
          Gap(h: 30),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Last Name',
                hintText: 'Enter your Last Name',
                suffixIcon: SvgImage('assets/icons/User.svg')),
          ),
          Gap(h: 30),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Address',
              hintText: 'Enter your address',
              suffixIcon: SvgImage('assets/icons/Discover.svg'),
            ),
          ),
          Gap(h: 30),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                suffixIcon: SvgImage('assets/icons/Call.svg')),
          ),
          Gap(h: 30),
          Defaultbutton(
            text: 'Create Profile',
            onpressed: () {
              // Navigator.pushNamed(context, OTPscreen.routeName);
              
            },
          ),
        ],
      ),
    );
  }
}

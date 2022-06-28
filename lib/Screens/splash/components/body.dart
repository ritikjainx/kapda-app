import 'package:flutter/material.dart';
import 'package:kapda/Screens/LoginPage/loginPage.dart';
import 'package:kapda/components/DefaultButton.dart';
import '../../../sizeConfig.dart';
import '../components/splashContent.dart';
import 'package:kapda/constants.dart';

int currentPage = 0;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map> splashpages = [
    {'text': 'One stop solution for your clothing needs', 'image': 'assets/images/splash_1.png'},
    {
      'text': 'Best quality goods available from reputed brands \n Delivered right at your doorstep',
      'image': 'assets/images/splash_2.png'
    },
    {
      'text': 'Browse through thousands of products with new products added regularly',
      'image': 'assets/images/splash_3.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashpages.length,
                itemBuilder: (context, int) {
                  return SplashContent(
                    text: splashpages[int]['text'],
                    image: splashpages[int]['image'],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashpages.length, (index) => Dot(index: index))),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: Defaultbutton(
                        text: 'Continue',
                        onpressed: () {
                          Navigator.pushNamed(context, LoginPage.routename);
                        },
                      ),
                    ),
                    const Spacer()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final int index;
  const Dot({this.index});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: kanimationDuration,
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
            color: currentPage == index ? kPrimaryColor : const Color(0xffd8d8d8), borderRadius: BorderRadius.circular(3)));
  }
}

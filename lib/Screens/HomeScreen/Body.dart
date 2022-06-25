import 'package:flutter/material.dart';
import 'package:kapda/Screens/DetailsScreen.dart/Detailscreen.dart';
import 'package:kapda/Modals/Product.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/sizeConfig.dart';
import 'components/DicountCard.dart';
import 'components/SectionBreak.dart';
import 'components/SpecialOfferCard.dart';
import 'components/categories.dart';
import 'components/productCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Discountcard(),
            SizedBox(height: getProportionateScreenHeight(25)),
            Categories(),
            SizedBox(height: getProportionateScreenHeight(15)),
            SectionBreakTitle(
              text: 'shop by catogory',
              onpress: () {},
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpecialOfferCard(
                    imagePath: 'assets/images/mens_colection.jpeg',
                    categoryTitle: 'Male',
                    onpress: () {
                      print('pressed');
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(15)),
                  SpecialOfferCard(
                    imagePath: 'assets/images/women_collection1.jpeg',
                    categoryTitle: 'Female',
                    onpress: () {
                      print('preseed');
                    },
                  )
                ],
              ),
            ),
            Gap(h: 20),
            SectionBreakTitle(
              text: 'Trending',
              onpress: () {},
            ),
            Gap(h: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      demoProducts.length,
                      (index) => ProductCard(
                        demoProduct: demoProducts[index],
                        onpress: () {
                          Navigator.pushNamed(context, DetailsScreen.routeName, arguments: demoProducts[index]);
                        },
                      ),
                    ))),
          ],
        ),
      ),
    ));
  }
}

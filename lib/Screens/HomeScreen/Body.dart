import 'package:flutter/material.dart';
import 'package:kapda/Screens/DetailsScreen.dart/Detailscreen.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/services/product_service.dart';
import 'package:kapda/sizeConfig.dart';
import 'package:provider/provider.dart';
import 'components/DicountCard.dart';
import 'components/SectionBreak.dart';
import 'components/SpecialOfferCard.dart';
import 'components/categories.dart';
import 'components/productCard.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    await Provider.of<ProductsService>(context,listen: false).getallProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<ProductsService>(builder: (context, productProvider, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // InkWell(
              //   onTap: () async {
              //     await productProvider.getallProducts();
              //   },
              //   child: Container(
              //     height: 100,
              //     width: 100,
              //     child: Center(
              //       child: Text("get Data"),
              //     ),
              //   ),
              // ),
              const Discountcard(),
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
              const Gap(h: 20),
              SectionBreakTitle(
                text: 'Trending',
                onpress: () {},
              ),
              const Gap(h: 20),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        productProvider.products.length,
                        (index) => ProductCard(
                          demoProduct: productProvider.products[index],
                          onpress: () {
                            Navigator.pushNamed(context, DetailsScreen.routeName,
                                arguments: productProvider.products[index]);
                          },
                        ),
                      ))),
            ],
          ),
        ),
      );
    }));
  }
}

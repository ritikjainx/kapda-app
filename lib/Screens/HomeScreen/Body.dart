import 'package:flutter/material.dart';
import 'package:kapda/Screens/DetailsScreen.dart/Detailscreen.dart';
import 'package:kapda/Screens/products_screen.dart';
import 'package:kapda/components/Gap.dart';
import 'package:kapda/services/product_service.dart';
import 'package:kapda/sizeConfig.dart';
import 'package:provider/provider.dart';
import '../../Modals/Product.dart';
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
    await Provider.of<ProductsService>(context, listen: false).getallProducts();
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
                        final List<Product> filteredList =
                            productProvider.products.where((element) => element.catagory == 'm').toList();
                        Navigator.pushNamed(context, ProductsScreen.routeName, arguments: filteredList);
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(15)),
                    SpecialOfferCard(
                      imagePath: 'assets/images/women_collection1.jpeg',
                      categoryTitle: 'Female',
                      onpress: () {
                        final List<Product> filteredList =
                            productProvider.products.where((element) => element.catagory == 'f').toList();

                        Navigator.pushNamed(context, ProductsScreen.routeName, arguments: filteredList);
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

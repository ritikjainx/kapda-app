import 'package:flutter/material.dart';
import 'package:kapda/Modals/Product.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';

class ProductImage extends StatefulWidget {
  final Product product;
  const ProductImage({this.product});

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          // width: getProportionateScreenWidth(238),
          width: double.infinity,
          height: getProportionateScreenHeight(220),
          child: AspectRatio(aspectRatio: 1, child: Image.network(widget.product.images)),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(
        //     widget.product.images.length,
        //     (index) => imagePrevCard(
        //       index,
        //     ),
        //   ),
        // )
      ],
    );
  }

  GestureDetector imagePrevCard(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selected = index;
          });
        },
        child: SizedBox(
          height: getProportionateScreenHeight(60),
          width: getProportionateScreenWidth(70),
          child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: selected == index ? kPrimaryColor : Colors.transparent),
              ),
              child: Image.asset(widget.product.images[index])),
        ),
      );
}

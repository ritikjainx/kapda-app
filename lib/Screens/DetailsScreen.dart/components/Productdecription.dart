import 'package:flutter/material.dart';
import 'package:kapda/Modals/Product.dart';

import '../../../sizeConfig.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(20)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: double.infinity),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.title,
                style: TextStyle(fontSize: getProportionateScreenHeight(20), fontWeight: FontWeight.w800),
              ),
              Text(
                '₹ ${product.price.toString()}',
                style: TextStyle(fontSize: getProportionateScreenHeight(20), fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(30)),
            child: Text(product.description,
                maxLines: 8,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(15),
                )),
          ),
          SizedBox(height: getProportionateScreenHeight(8)),
        ],
      ),
    );
  }
}

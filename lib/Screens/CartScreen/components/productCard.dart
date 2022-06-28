import 'package:flutter/material.dart';
import 'package:kapda/Modals/Cartstuff.dart';
import '../../../constants.dart';
import '../../../sizeConfig.dart';

class ProductCard extends StatelessWidget {
  final CartStuff productdetails;

  const ProductCard({Key key, this.productdetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          Container(
            height: getProportionateScreenHeight(88),
            width: getProportionateScreenWidth(88),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xfffff5f6f9), borderRadius: BorderRadius.circular(30)),
            child: AspectRatio(aspectRatio: 0.88, child: Image.network(productdetails.image)),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: getProportionateScreenHeight(88),
            width: SizeConfig.screenWidth * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productdetails.title,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black, fontSize: getProportionateScreenHeight(20)),
                ),
                const SizedBox(height: 5),
                Text.rich(TextSpan(
                  text: '\$ ${productdetails.price.toString()}',
                  style: TextStyle(color: kPrimaryColor, fontSize: getProportionateScreenHeight(15)),
                  children: [
                    TextSpan(text: ' X ${productdetails.quantity.toString()}', style: const TextStyle(color: kTextColor))
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

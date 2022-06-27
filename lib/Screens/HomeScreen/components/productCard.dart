import 'package:flutter/material.dart';
import 'package:kapda/Modals/Product.dart';
import 'package:kapda/services/product_service.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../sizeConfig.dart';

class ProductCard extends StatefulWidget {
  final Product demoProduct;
  final Function onpress;

  const ProductCard({this.demoProduct, this.onpress});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: widget.onpress,
        child: SizedBox(
          width: getProportionateScreenWidth(140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // color: kSecondryColor.withOpacity(0.1),
                  border: Border.all(color: kSecondryColor.withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(widget.demoProduct.images),
                ),
              ),
              Text(
                widget.demoProduct.title,
                style: TextStyle(fontSize: getProportionateScreenHeight(14), color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹ ${widget.demoProduct.price.toString()}',
                    style: TextStyle(fontSize: getProportionateScreenHeight(18), color: Colors.deepOrange),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.demoProduct.isFavourite = !widget.demoProduct.isFavourite;
                      });
                      Product p = widget.demoProduct;
                      Provider.of<ProductsService>(context, listen: false).updateProductKey(
                        id: p.id.toString(),
                        key: 'isFav',
                        value: p.isFavourite.toString(),
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kSecondryColor.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: getProportionateScreenHeight(15),
                          color: widget.demoProduct.isFavourite ? const Color(0xffff4848) : const Color(0xffdedbe4),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

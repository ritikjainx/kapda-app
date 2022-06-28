import 'package:flutter/material.dart';
import 'package:kapda/Modals/Cartstuff.dart';
import 'package:kapda/Modals/Product.dart';
import 'package:kapda/Screens/DetailsScreen.dart/components/sizes_maker.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/sizeConfig.dart';
import '../../../services/cart_products.dart';
import 'Button.dart';
import 'ProductImage.dart';
import 'Productdecription.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({this.product});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(product: widget.product),
          ProductDescription(product: widget.product),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 10),
                child: Text(
                  'Choose Size',
                  style: TextStyle(color: Colors.black, fontSize: getProportionateScreenHeight(15)),
                ),
              ),
              // ColorDots(product: product.sizes),
              SizeMaker(
                sizes: widget.product.sizes,
                selected: selected,
                onTap: (int index) {
                  setState(() {
                    selected = index;
                  });
                },
              ),
            ],
          ),
          AddToCart(
            product: widget.product,
            size: widget.product.sizes[selected],
          )
        ],
      ),
    );
  }
}

class AddToCart extends StatefulWidget {
  final Product product;
  final String size;
  const AddToCart({Key key, this.product, this.size}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40), top: getProportionateScreenHeight(15)),
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Buttons(
              icon: Icons.remove,
              onpress: () {
                if (counter > 0) {
                  counter--;
                }
                setState(() {});
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              color: Colors.white,
              child: Text(
                counter.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Buttons(
              icon: Icons.add,
              onpress: () {
                setState(() {
                  counter++;
                });
              },
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.5,
              child: Defaultbutton(
                text: 'Add To Cart',
                onpressed: () {
                  if (counter != 0) {
                    final cartProvider = Provider.of<CartProducts>(context, listen: false);
                    // List<CartStuff> addedproductscopy = context.read<CartProducts>().items;
                    List<CartStuff> addedproductscopy = cartProvider.items;
                    int count = 0;
                    int index;
                    for (int i = 0; i < addedproductscopy.length; i++) {
                      if (addedproductscopy[i].id == widget.product.id && addedproductscopy[i].size == widget.size) {
                        count++;
                        index = i;
                      }
                    }
                    if (count == 1) {
                      cartProvider.counter(counter: counter, index: index);
                       ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('$counter more ${widget.product.title} added to cart'),
                      ));
                    } else {
                      cartProvider.addproducts(widget.product.images, widget.product.price, widget.product.title,
                          counter, widget.product.id, widget.size);
                           ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$counter ${widget.product.title} added to cart')));
                    }
                  } else {
                     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('please select number of items to be added')));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

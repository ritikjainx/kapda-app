import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapda/sizeConfig.dart';
import 'package:provider/provider.dart';
import '../../../services/cart_products.dart';
import 'checkoutbar.dart';
import 'productCard.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Consumer<CartProducts>(builder: (context, cartproducts, child) {
          return cartproducts.items.isEmpty
              ? const Center(
                  child: Text("No items added in cart"),
                )
              : ListView.builder(
                  itemCount: cartproducts.items.length,
                  itemBuilder: (context, index) {
                    final productdetails = cartproducts.items;
                    return Dismissible(
                      key: Key(productdetails[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          cartproducts.removeproduct(index);
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text('Item removed from cart')));
                      },
                      background: Container(
                        padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                        color: const Color(0xffffe6e6),
                        child: Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/icons/Trash.svg',
                              height: getProportionateScreenHeight(20),
                            ),
                          ],
                        ),
                      ),
                      child: CartProductCard(productdetails: productdetails[index]),
                    );
                  });
        }),
      ),
      CheckOutBar(),
    ]);
  }
}

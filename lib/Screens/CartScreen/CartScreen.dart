import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/cart_products.dart';
import 'components/Body.dart';
import 'package:kapda/sizeConfig.dart';
import '../../components/BottomnavBar.dart';
import '../../Menustate.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selected: MenuState.cart,
      ),
      appBar: AppBar(
        title: Center(
          child: Text.rich(
              TextSpan(
                text: 'Your Cart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '\n ${context.read<CartProducts>().items.length} Items',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  )
                ],
              ),
              textAlign: TextAlign.center),
        ),
      ),
      body: Body(),
    );
  }
}

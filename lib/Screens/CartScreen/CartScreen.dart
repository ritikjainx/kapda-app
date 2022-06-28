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
      bottomNavigationBar: const BottomNavBar(
        selected: MenuState.cart,
      ),
      appBar: AppBar(
        title: Text.rich(
            TextSpan(
              text: 'Your Cart',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(
                  text: '\n ${context.watch<CartProducts>().items.length} Items',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                )
              ],
            ),
            textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

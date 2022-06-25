import 'package:flutter/material.dart';
import 'package:kapda/constants.dart';
import 'package:provider/provider.dart';
import '../../components/BottomnavBar.dart';
import '../../Menustate.dart';
import '../../services/cart_products.dart';
import '../CartScreen/CartScreen.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selected: MenuState.homepage,
      ),
      appBar: AppBar(
        title: Text(
          "Kapda",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: Row(
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: kTextColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  context.read<CartProducts>().items.length.toString(),
                  style: TextStyle(color: kTextColor),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}

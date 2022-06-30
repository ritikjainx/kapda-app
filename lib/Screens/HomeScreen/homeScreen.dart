import 'package:flutter/material.dart';
import 'package:kapda/constants.dart';
import 'package:provider/provider.dart';
import '../../components/bottomnavBar.dart';
import '../../menu_state.dart';
import '../../services/cart_products.dart';
import '../../size_config.dart';
import '../CartScreen/CartScreen.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        selected: MenuState.homepage,
      ),
      appBar: AppBar(
        title: const Text(
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
                context.watch<CartProducts>().items.length == 1
                    ? Text(
                        "${context.watch<CartProducts>().items.length} Item",
                        style: const TextStyle(color: kTextColor),
                      )
                    : Text(
                        "${context.watch<CartProducts>().items.length} Items",
                        style: const TextStyle(color: kTextColor),
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

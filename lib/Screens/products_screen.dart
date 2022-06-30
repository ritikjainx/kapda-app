import 'package:flutter/material.dart';
import 'package:kapda/services/product_service.dart';
import 'package:provider/provider.dart';
import '../Constants.dart';
import '../menu_state.dart';
import '../Modals/Product.dart';
import '../components/bottomnavBar.dart';
import '../services/cart_products.dart';
import 'CartScreen/CartScreen.dart';
import 'DetailsScreen.dart/Detailscreen.dart';
import 'HomeScreen/components/productCard.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = "/productsScreen";

  const ProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(
          // selected: MenuState.favourite,
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
        body: Body(products: arguments));
  }
}

class Body extends StatefulWidget {
  const Body({Key key, this.products}) : super(key: key);
  final List<Product> products;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> filteredProducts = [];
  @override
  void initState() {
    super.initState();
  }

  initData() {
    if (widget.products == null || widget.products.isEmpty) {
      filteredProducts =
          Provider.of<ProductsService>(context).products.where((element) => element.isFavourite == true).toList();
    } else {
      filteredProducts = widget.products;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("rebuilding products screen");
    initData();
    if (filteredProducts.isEmpty) {
      return const Center(
        child: Text("No items added as Favourite"),
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (_, index) {
          return ProductCard(
            demoProduct: filteredProducts[index],
            onpress: () {
              Navigator.pushNamed(context, DetailsScreen.routeName, arguments: filteredProducts[index]);
            },
          );
        },
      );
    }
  }
}

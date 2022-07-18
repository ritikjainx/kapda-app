import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modals/ApiModels/product_modal.dart';
import 'auth_provider.dart';
import 'gsheets.dart';

class ProductsService extends ChangeNotifier {
  List<Product> products = [];

  getallProducts() async {
    List<Map<String, String>> jsonData = await GSheetsApi.getAllProducts();
    products = jsonData.map((productjson) => Product.fromJson(productjson)).toList();
    notifyListeners();
  }

  toggleFavStatus({int id, BuildContext context}) async {
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    bool isThere = user.favItems.contains(id);
    if (isThere) {
      user.favItems.remove(id);
    } else {
      user.favItems.add(id);
    }

    await GSheetsApi.manageFavStatusInUserData(user: user);
    notifyListeners();
  }
}

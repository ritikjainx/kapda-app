import 'package:flutter/material.dart';

import '../Modals/Product.dart';
import 'gsheets.dart';

class ProductsService extends ChangeNotifier {
  List<Product> products = [];

  getallProducts() async {
    List<Map<String, String>> jsonData = await GSheetsApi.getAllProducts();
    products = jsonData.map((productjson) => Product.fromJson(productjson)).toList();
    notifyListeners();
  }

  updateProductKey({String id, String key, String value}) async {
    await GSheetsApi.updateProductbyKey(id: id, key: key, value: value);
  }

  toggleFavStatus({int id}) {
    int index = products.indexWhere((element) => element.id == id);
    Product newProduct = products[index];
    newProduct.isFavourite = !newProduct.isFavourite;
    products[index] = newProduct;
    print(products[index].isFavourite);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../Modals/Cartstuff.dart';

class CartProducts extends ChangeNotifier {
  final List<CartStuff> _addedproduct = [];

  List get items =>_addedproduct;

  void addproducts(String imagepath, double price, String title, int qty, int id,String size) {
    _addedproduct.add(CartStuff(image: imagepath, price: price, title: title, quantity: qty, id: id,size: size));
    notifyListeners();
  }

  void removeproduct(index) {
    _addedproduct.removeAt(index);
    notifyListeners();
  }

  void counter({int counter, int index}) {
    _addedproduct[index].quantity = _addedproduct[index].quantity + counter;
    notifyListeners();
  }

  double total() {
    double total = 0;
    for (int i = 0; i < _addedproduct.length; i++) {
      total = total + _addedproduct[i].price * _addedproduct[i].quantity;
    }
    return total;
  }
}

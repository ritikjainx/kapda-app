import 'package:flutter/material.dart';
import '../../modals/ApiModels/product_modal.dart';
import 'components/Body.dart';
import 'components/CustomAppBar.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/Details_screen';
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xffeeeff0),
      appBar: CustomAppBar(rating: (arguments as Product).rating),
      body: Body(
        product: arguments,
      ),
    );
  }
}

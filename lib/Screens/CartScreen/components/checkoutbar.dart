import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/constants.dart';
import '../../../services/cart_products.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';

class CheckOutBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Color(0xfffff5f6f9),
            offset: Offset(0, -12),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/receipt.svg'),
              const Spacer(),
              const Text('Add Discount Coupon'),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_ios,
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(TextSpan(
                text: 'Total \n',
                children: [
                  TextSpan(
                    text: '\$ ${context.read<CartProducts>().total().toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              )),
              const Spacer(),
              SizedBox(
                width: SizeConfig.screenWidth * 0.5,
                child: Defaultbutton(
                  text: 'CheckOut',
                  onpressed: () async {
                    await showDialog(
                        context: context,
                        builder: (_) {
                          return SimpleDialog(
                            titlePadding: const EdgeInsets.all(0),
                            title: Container(
                              padding: const EdgeInsets.all(10),
                              color: kPrimaryColor,
                              child: Text(
                                "Total payment\n ${'\$ ${context.read<CartProducts>().total().toStringAsFixed(2)}'}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            children: [
                              ListTile(
                                title: const Text("Pay with UPI"),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('payment successful')));
                                },
                              ),
                              const Divider(),
                              ListTile(
                                title: const Text("Pay with Net Banking"),
                                trailing: const Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('payment successful')));
                                },
                              ),
                              const Divider(),
                              ListTile(
                                trailing: const Text("Cancel"),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapda/components/DefaultButton.dart';
import 'package:kapda/constants.dart';
import '../../../services/cart_products.dart';
import '../../../sizeConfig.dart';
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
                            title: Container(
                              color: kPrimaryColor,
                              child: Text(
                                "Total payment\n ${'\$ ${context.read<CartProducts>().total().toStringAsFixed(2)}'}",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            children: [
                              Divider(),
                              ListTile(
                                title: Text("Pay with UPI"),
                                onTap: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('payment successful')));
                                },
                              ),
                              ListTile(
                                title: Text("Pay with Net Banking"),
                                onTap: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('payment successful')));
                                },
                              ),
                              ListTile(
                                trailing: Text("Cancel"),
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

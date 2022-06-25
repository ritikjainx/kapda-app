import 'package:flutter/material.dart';
import 'package:kapda/Modals/Product.dart';

import '../../../sizeConfig.dart';

class SizeMaker extends StatefulWidget {
  const SizeMaker({Key key, this.sizes}) : super(key: key);

  final List<String> sizes;

  @override
  _SizeMakerState createState() => _SizeMakerState();
}

class _SizeMakerState extends State<SizeMaker> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.sizes.length, (index) => size(index)),
    );
  }

  GestureDetector size(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selected = index;
          });
        },
        child: Container(
            margin: EdgeInsets.only(left: 40),
            padding: EdgeInsets.all(4),
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: selected == index ? Colors.deepOrangeAccent : Colors.transparent),
            ),
            child: Center(
              child: Text(widget.sizes[index]),
            )),
      );
}

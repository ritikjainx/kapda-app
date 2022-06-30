import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SizeMaker extends StatelessWidget {
  const SizeMaker({Key key, this.sizes, this.onTap, this.selected}) : super(key: key);

  final List<String> sizes;
  final Function onTap;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(sizes.length, (index) => size(index)),
    );
  }

  GestureDetector size(int index) => GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
            margin: const EdgeInsets.only(left: 40),
            padding: const EdgeInsets.all(4),
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: selected == index ? Colors.deepOrangeAccent : Colors.transparent),
            ),
            child: Center(
              child: Text(sizes[index]),
            )),
      );
}

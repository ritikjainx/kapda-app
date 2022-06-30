import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class FormStateError extends StatelessWidget {
  final List<String> errors;

  const FormStateError({this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(children: List.generate(errors.length, (index) => buildRow(errors[index])));
  }

  Row buildRow(String errorMessage) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: getProportionateScreenHeight(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(errorMessage),
      ],
    );
  }
}

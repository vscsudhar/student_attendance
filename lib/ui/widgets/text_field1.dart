import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../shared/styles.dart';

class TextField1 extends StatelessWidget {
  const TextField1({
    this.initialValue,
    this.hintText,
    super.key,
  });

  final String? initialValue;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                    keyboardType: TextInputType.text, //username or email
                    initialValue: initialValue ?? '',
                    style: fontFamilyBold.size16.color2699FB,
                    decoration:  InputDecoration(
                      hintText: hintText ?? '',
                      hintStyle: fontFamilyBold.size16
                    ),
                  );
  }
}

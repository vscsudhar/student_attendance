import 'package:flutter/material.dart';

import '../shared/styles.dart';

class TextField1 extends StatelessWidget {
  const TextField1({
    this.obscureText = false,
    this.initialValue,
    this.hintText,
    this.onSaved,
    this.onChanged,
    this.validator,
    super.key,
  });

  final String? initialValue;
  final String? hintText;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text, //username or email
      initialValue: initialValue ?? '',
      style: fontFamilyBold.size16.color2699FB,
      decoration: InputDecoration(hintText: hintText ?? '', hintStyle: fontFamilyBold.size16),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      obscureText:  false,
    );
  }
}

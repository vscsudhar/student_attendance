import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';

class Button extends StatelessWidget {
  const Button({
    required this.name,
    required this.onPressed,
    this.height,
    this.width,
    super.key,
  });
  final Function() onPressed;
  final String name;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 250,
        height: height ?? 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: appcolor2699FB, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: defaultPadding10,
          child: Text(name,style: fontFamilyRegular.size20.copyWith(color: Colors.white),),
        ),
      ),
    );
  }
}

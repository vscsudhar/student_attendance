import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';

class Box extends StatelessWidget {
  const Box({
    required this.child,
    this.height,
    this.width,
    this.onTap,
    this.padding,
    this.margin,
    super.key,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: padding ?? const EdgeInsets.all(14),
            margin: margin ?? defaultPadding20,
            width: width ?? double.infinity,
            height: height,
            decoration: const BoxDecoration(
                color: appcolor2699FB,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                )),
            child: child,
          ),
        ],
      ),
    );
  }
}

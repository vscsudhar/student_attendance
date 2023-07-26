import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';

import 'circular_progress_indicator.dart';

class Button1 extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;

  const Button1({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
    //this.leading, required Null Function() onPressed,
  })  : outline = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? onTap : () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? appcolor2699FB : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: appcolor2699FB,
                  width: 1,
                )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  Text(title, style: fontFamilyBold.size14.white),
                ],
              )
            // : Center(
            //     child: Padding(
            //     padding: defaultPadding20,
            //     child: AnimatedCircularProgressIndicator(
            //       color: Colors.white,
            //       backgroundColor: Colors.grey,
            //     ),

            //   )),
        : const CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
      ),
    );
  }
}

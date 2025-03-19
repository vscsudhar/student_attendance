import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class MessageDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final String? mainButtonTitle;
  final Function() onMainButtonClick;
  const MessageDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.onMainButtonClick,
    this.mainButtonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.white70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: leftPadding20 + rightPadding20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpacing20,
                  Text(
                    title ?? 'Title not available',
                    style: fontFamilyBold.size16.color2699FB,
                  ),
                  verticalSpacing8,
                  Text(
                    description ?? 'Description not available.',
                    textAlign: TextAlign.center,
                    style: fontFamilyRegular.size12.color2699FB,
                  ),
                  verticalSpacing20,
                ],
              ),
            ),
            horizontalDivider,
            SizedBox(
              height: 50,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                onTap: onMainButtonClick,
                child: Center(
                  child: Text(
                    mainButtonTitle ?? 'Okay',
                    style: fontFamilyBold.size16.color2699FB,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

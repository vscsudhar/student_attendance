import 'package:flutter/material.dart';

import '../../shared/styles.dart';

class ErrorDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final String? mainButtonTitle;
  final Function() onMainButtonClick;
  const ErrorDialog({
    Key? key,
    this.title,
    this.description,
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      title ?? 'Error',
                      style: fontFamilyBold.size16.white,
                    ),
                    verticalSpacing8,
                    Text(
                      description ?? 'Description not available.',
                      textAlign: TextAlign.center,
                      style: fontFamilyRegular.size14.white,
                    ),
                    verticalSpacing20,
                  ],
                ),
              ),
              // horizontalDivider,

              horizontalDivider,
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Center(
                          child: Padding(
                            padding: defaultPadding12,
                            child: Text(
                              'Report a bug',
                              style: fontFamilyBold.size16.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalDivider,
                    Expanded(
                      child: InkWell(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15)),
                        onTap: onMainButtonClick,
                        child: Center(
                          child: Padding(
                            padding: defaultPadding8,
                            child: Text(
                              mainButtonTitle ?? 'Dismiss',
                              style: fontFamilyBold.size16.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

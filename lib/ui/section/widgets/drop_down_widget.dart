import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    required this.dropDownList,
    this.title,
    super.key,
  });

  final String? title;
  final List<DropDownValueModel> dropDownList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? '', style: fontFamilyRegular.size14.color2699FB),
        DropDownTextField(
          dropDownList: dropDownList,
          dropDownItemCount: dropDownList.length,
          textStyle: fontFamilyBold.size16,
          readOnly: false,
          searchAutofocus: true,
          padding: zeroPadding,
          dropdownColor: appcolor2699FB,
          listTextStyle: fontFamilyBold.size16.white,
        ),
      ],
    );
  }
}

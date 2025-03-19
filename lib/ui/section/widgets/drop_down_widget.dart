import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:workspace/core/models/dropdown_model.dart';
import 'package:workspace/ui/shared/styles.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    required this.validator,
    required this.dropDownList,
    this.title,
    this.selectedValue,
    super.key,
  });

  final String? title;
  final String? selectedValue;
  final List<DropDownModel> dropDownList;
  final void Function(dynamic)? validator;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.selectedValue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing10,
        Text(widget.title ?? '',
            style: fontFamilyBold.size14.copyWith(color: Colors.black)),
        Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              5,
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.4),
                offset: Offset(3, 3),
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: leftPadding20,
            child: DropdownButton(
              isExpanded: true,
              // value: '',
              // padding: leftPadding20,
              style: fontFamilyBold.size16.color2699FB,
              onTap: () {
                print('${widget.title} clicked');
              },
              // disabledHint: Text(
              //   'Please select ${widget.title}',
              //   style: fontFamilyRegular.size14.copyWith(color: Colors.black),
              // ),
              hint: Text(
                widget.selectedValue ?? 'Please select ${widget.title}',
                style: fontFamilyMedium.size14.copyWith(
                    color: widget.selectedValue != null
                        ? appcolor2699FB
                        : Colors.black),
              ),
              items: List.generate(widget.dropDownList.length, (index) {
                return DropdownMenuItem(
                  child: Text(
                    widget.dropDownList[index].name ?? 'N/A',
                    style: fontFamilyRegular.size14.color2699FB,
                  ),
                  value: widget.dropDownList[index].value,
                );
              }),
              onChanged: widget.validator,
            ),
          ),
        )
      ],
    );
  }
}

// DropDownTextField(
//   dropDownList: dropDownList,
//   dropDownItemCount: dropDownList.length,
//   textStyle: fontFamilyBold.size16,
//   readOnly: false,
//   searchAutofocus: true,
//   padding: zeroPadding,
//   dropdownColor: appcolor2699FB,
//   listTextStyle: fontFamilyBold.size16.white,
//   validator: validator,
// ),

import 'package:flutter/material.dart';

import '../../shared/styles.dart';
import '../../widgets/box.dart';

class StudentListWidget extends StatelessWidget {
  const StudentListWidget({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Center(
            child: Text(
              name,
              style: fontFamilyRegular.size18.color2699FB,
            ),
          ),
          const Spacer(),
          const Box(
              margin: zeroPadding,
              padding: defaultPadding8,
              width: 80,
              height: 30,
              boxColor: Colors.red,
              child: Text(
                "Absent",
                textAlign: TextAlign.center,
              )),
          horizontalSpacing12,
          const Box(
              margin: zeroPadding,
              padding: defaultPadding8,
              width: 80,
              height: 30,
              boxColor: Colors.green,
              child: Text(
                "Present",
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}

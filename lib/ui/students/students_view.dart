import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students',
          style: fontFamilyBold.size20.white,
        ),
      ),
      body: ListView.separated(
        padding: defaultPadding20,
        itemBuilder: (context, index) => Text(
          'Student $index',
          style: fontFamilyRegular.size14.color2699FB,
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: defaultPadding8,
          child: horizontalDivider,
        ),
        itemCount: 10,
      ),
    );
  }
}

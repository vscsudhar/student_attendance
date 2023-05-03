import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/students/widgets/student_list_widget.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students',
          style: fontFamilyBold.size24.white,
        ),
      ),
      body: ListView.separated(
        padding: defaultPadding20,
        itemBuilder: (context, index) {
          return StudentListWidget(name: 'Student $index');
        },
        separatorBuilder: (context, index) => verticalSpacing20,
        itemCount: 10,
      ),
    );
  }
}

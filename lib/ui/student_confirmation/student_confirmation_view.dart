import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/models/section_model.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/student_confirmation/student_confirmation_viewmodel.dart';

import '../../core/models/students_model.dart';

class StudentConfirmationView extends StackedView<StudentConfirmationViewModel> {
  const StudentConfirmationView({
    required this.absentStudentList,
    required this.presentStudentList,
    super.key,
  });

  final List<Student> absentStudentList;
  final List<Student> presentStudentList;

  @override
  Widget builder(BuildContext context, StudentConfirmationViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirmation',
          style: fontFamilyBold.size16.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: defaultPadding20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Absented students',
              style: fontFamilyBold.size14.color2699FB,
            ),
            verticalSpacing20,
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Text(absentStudentList[index].studentName ?? ''),
              separatorBuilder: (context, index) => const Padding(
                padding: defaultPadding8,
                child: horizontalDivider,
              ),
              itemCount: absentStudentList.length,
            ),
            verticalSpacing20,
            horizontalDivider,
            verticalSpacing20,
            Text(
              'Presented students',
              style: fontFamilyBold.size14.color2699FB,
            ),
            verticalSpacing20,
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Text(presentStudentList[index].studentName ?? ''),
              separatorBuilder: (context, index) => const Padding(
                padding: defaultPadding8,
                child: horizontalDivider,
              ),
              itemCount: presentStudentList.length,
            ),
          ],
        ),
      ),
    );
  }

  @override
  StudentConfirmationViewModel viewModelBuilder(BuildContext context) => StudentConfirmationViewModel();
}

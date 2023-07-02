import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/student_details/studentsdetails_viewmodel.dart';

class StudentDetailsView extends StatelessWidget {
  const StudentDetailsView({
    required this.student,
    super.key,
  });

  final GetStudentResponse student;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StudentDetailsViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: !viewModel.isBusy
                ? Column(children: [
                    // CircleAvatar(
                    //   maxRadius: 80,
                    //   foregroundImage: NetworkImage(viewModel.data?.avatar ?? ''),
                    // ),
                    // verticalSpacing16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [const Text('RollNo:', style: fontFamilyRegular), Text(student.rollNo?.toString() ?? 'N/A')],
                    ),
                    verticalSpacing16,
                    Text('Name: ${student.studentName} '),
                    verticalSpacing16,
                    Text('Class ID: ${student.classId}'),
                    // verticalSpacing16,
                    // const Text('year: 2023')
                  ])
                : emptySpacing),
      ),
    );
  }
}

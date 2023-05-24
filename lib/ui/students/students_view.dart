import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/students/students_viewmodel.dart';
import 'package:workspace/ui/students/widgets/student_list_widget.dart';
import 'package:workspace/ui/widgets/button1.dart';

import '../../core/models/students_model.dart';

class StudentView extends StatefulWidget {
  const StudentView({required this.data, super.key});

  final List<Data>? data;

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentsViewModel(widget.data ?? []),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Students',
                  style: fontFamilyBold.size24.white,
                ),
              ),
              body: Visibility(
                visible: !viewModel.isBusy,
                child: Stack(
                  children: [
                    ListView.separated(
                      padding: defaultPadding20,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const Text(''),
                            InkWell(
                              onTap: () => viewModel.goToStudentDetails(viewModel.studentList[index].id ?? 0),
                              child: Card(
                                child: StudentListWidget(
                                  data: viewModel.studentList[index],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpacing20,
                      itemCount: viewModel.studentList.length,
                    ),
                     Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: defaultPadding20,
                        child: Button1(
                          onTap: () => viewModel.goToStudentConfirmation(viewModel.absentStudentList, viewModel.presentStudentList),
                          title: 'Next',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

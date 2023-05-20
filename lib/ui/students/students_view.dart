import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/students/students_viewmodel.dart';
import 'package:workspace/ui/students/widgets/student_list_widget.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentsViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Students',
                  style: fontFamilyBold.size24.white,
                ),
              ),
              body: Visibility(
                visible: !viewModel.isBusy,
                child: ListView.separated(
                  padding: defaultPadding20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Text(''),
                        Card(
                          child: StudentListWidget(name: '${viewModel.studentList[index].firstName}\n${viewModel.studentList[index].lastName}'),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => verticalSpacing20,
                  itemCount: viewModel.studentList.length,
                ),
              ),
            ));
  }
}

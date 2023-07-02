import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/students/students_viewmodel.dart';
import 'package:workspace/ui/students/widgets/student_list_widget.dart';

class StudentView extends StatefulWidget {
  const StudentView({
    required this.cId,
    super.key,
  });

  final String cId;
  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentsViewModel(widget.cId),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Students',
                style: fontFamilyBold.size24.white,
              ),
            ),
            body: !viewModel.isBusy
                ? Stack(
                    children: [
                      viewModel.studentList.isNotEmpty
                          ? ListView.separated(
                              padding: defaultPadding20,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    const Text(''),
                                    // only one view student name
                                    //  if(index ==0)
                                    InkWell(
                                      onTap: () => viewModel.goToStudentDetails(viewModel.studentList[index]),
                                      child: Container(
                                        height: 180, //150
                                        decoration: BoxDecoration(
                                          color: appcolor2699FB,
                                          borderRadius: BorderRadius.circular(25.0),
                                        ),

                                        child: Card(
                                          elevation: 20.0,
                                          margin: defaultPadding10,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                          child: StudentListWidget(
                                            data: viewModel.studentList[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) => verticalSpacing20,
                              itemCount: viewModel.studentList.length,
                            )
                          : const Center(
                              child: Text('Student data is not available'),
                            ),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Padding(
                      //     padding: defaultPadding20,
                      //     child: Button1(
                      //      // disabled: viewModel.studentList.isEmpty,
                      //       onTap: () =>,
                      //       title: 'Next',
                      //     ),
                      //   ),
                      // )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: appcolor2699FB,
                    ),
                  )));
  }
}

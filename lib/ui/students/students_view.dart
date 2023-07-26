import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/students/students_viewmodel.dart';
import 'package:workspace/ui/students/widgets/student_list_widget.dart';

import '../widgets/circular_progress_indicator.dart';

class StudentView extends StatefulWidget {
  const StudentView({
    required this.cId,
    required this.hId,
    required this.subjectId,
    super.key,
  });

  final String cId;
  final String hId;
  final String subjectId;

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
  }

  // The key of the list
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => StudentsViewModel(widget.cId, widget.hId, widget.subjectId, _listKey),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appcolor2699FB,
              title: Row(
                children: [
                  Image.asset(
                    'assets/icons/class.png',
                    width: 30,
                    height: 35,
                  ),
                  horizontalSpacing20,
                  Text(
                    'Students',
                    style: fontFamilyBold.size24.white,
                  ),
                ],
              ),
            ),
            body: !viewModel.isBusy
                ? Stack(
                    children: [
                      viewModel.studentList.isNotEmpty
                          ?
                          // ListView.separated(
                          //     padding: defaultPadding20,
                          //     itemBuilder: (context, index) => StudentListWidget(data: viewModel.studentList[index]),
                          //     separatorBuilder: (context, index) => verticalSpacing20,
                          //     itemCount: viewModel.studentList.length,
                          //   )
                          AnimatedList(
                              key: _listKey,
                              initialItemCount: viewModel.studentList.length,
                              itemBuilder: (context, index, animation) {
                                return SizeTransition(
                                  key: UniqueKey(),
                                  sizeFactor: animation,
                                  child: StudentListWidget(
                                    data: viewModel.studentList[index],
                                    index: index,
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text('Student data is not available'),
                            ),
                    ],
                  )
                : Center(
                    child: Padding(
                    padding: defaultPadding20,
                    child: AnimatedCircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.grey,
                    ),
                  )),
          );
        });
  }
}
   // CircularProgressIndicator(
                                      //   color: Colors.white,
                                      //   backgroundColor: Colors.grey,
                                      // ),
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/ui/students/students_viewmodel.dart';

import '../../shared/styles.dart';
import '../../widgets/box.dart';

class StudentListWidget extends ViewModelWidget<StudentsViewModel> {
  const StudentListWidget({
    required this.data,
    required this.index,
    super.key,
  });

  final GetStudentResponse data;
  final int index;
  @override
  Widget build(BuildContext context, StudentsViewModel viewModel) {
    return Padding(
      padding: defaultPadding12,
      child: Container(
        height: 130, //150
        decoration: BoxDecoration(
          color: appcolor2699FB,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Card(
          elevation: 20.0,
          margin: const EdgeInsets.all(2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: defaultPadding12,
                    child: Center(
                      child: Text(
                        '${data.studentName}\n${data.rollNo}',
                        style: fontFamilyRegular.size18.color2699FB,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Box(
                      onTap: () {
                        viewModel.addAbsentList(data);
                        removeItem(index, data, viewModel, false);
                      },
                      margin: zeroPadding,
                      padding: defaultPadding8,
                      width: 80,
                      height: 40,
                      boxColor: Colors.red,
                      child: const Text(
                        "Absent",
                        textAlign: TextAlign.center,
                      )),
                  horizontalSpacing12,
                  Padding(
                    padding: defaultPadding8,
                    child: Box(
                        onTap: () {
                          viewModel.addPresentList(data);
                          removeItem(index, data, viewModel, true);
                        },
                        margin: zeroPadding,
                        padding: defaultPadding8,
                        width: 80,
                        height: 40,
                        boxColor: Colors.green,
                        child: const Text(
                          "Present",
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void removeItem(int index, GetStudentResponse student,
      StudentsViewModel viewModel, bool isPresent) {
    viewModel.key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 10,
          color: isPresent ? Colors.green : Colors.red,
          child: ListTile(
            contentPadding: const EdgeInsets.all(15),
            title: Text(isPresent ? "Present" : "Absent",
                style: const TextStyle(fontSize: 24)),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 300));
  }
}

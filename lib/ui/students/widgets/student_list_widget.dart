import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/models/section_model.dart';
import 'package:workspace/ui/students/students_viewmodel.dart';

import '../../../core/models/students_model.dart';
import '../../shared/styles.dart';
import '../../widgets/box.dart';

class StudentListWidget extends ViewModelWidget<StudentsViewModel> {
  const StudentListWidget({required this.data, super.key});

  final Student data;
  @override
  Widget build(BuildContext context, StudentsViewModel viewModel) {
    return Center(
      child: InkWell(
        child: Row(
          children: [
            Center(
              child: Text(
                '${data.studentName}\n${data.rollNo}',
                style: fontFamilyRegular.size18.color2699FB,
              ),
            ),
            const Spacer(),
            Box(
                onTap: () => viewModel.addAbsentList(data),
                margin: zeroPadding,
                padding: defaultPadding8,
                width: 80,
                height: 30,
                boxColor: Colors.red,
                child: const Text(
                  "Absent",
                  textAlign: TextAlign.center,
                )),
            horizontalSpacing12,
            Box(
                onTap: () => viewModel.addPresentList(data),
                margin: zeroPadding,
                padding: defaultPadding8,
                width: 80,
                height: 30,
                boxColor: Colors.green,
                child: const Text(
                  "Present",
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}

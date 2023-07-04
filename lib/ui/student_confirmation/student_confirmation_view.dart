import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/student_confirmation/student_confirmation_viewmodel.dart';
import 'package:workspace/ui/widgets/box.dart';

import '../../core/models/students_model.dart';

class StudentConfirmationView extends StackedView<StudentConfirmationViewModel> {
  const StudentConfirmationView({
    required this.cid,
    required this.hid,
    required this.subjectId,
    required this.absentStudentList,
    required this.presentStudentList,
    super.key,
  });

  final List<GetStudentResponse> absentStudentList;
  final List<GetStudentResponse> presentStudentList;

  final int cid;
  final int hid;
  final int subjectId;

  @override
  Widget builder(BuildContext context, StudentConfirmationViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirmation',
          style: fontFamilyBold.size16.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            padding: defaultPadding20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Absented students',
                      style: fontFamilyBold.size18.red,
                    ),
                    const Spacer(),
                    const Box(
                        margin: zeroPadding,
                        padding: defaultPadding8,
                        width: 70,
                        height: 30,
                        boxColor: Colors.cyan,
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                        )),
                  ],
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Presented students',
                      style: fontFamilyBold.size18.color2699FB,
                    ),
                    const Spacer(),
                    const Box(
                        margin: zeroPadding,
                        padding: defaultPadding8,
                        width: 70,
                        height: 30,
                        boxColor: Colors.cyan,
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                        )),
                  ],
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
          verticalSpacing60,
          verticalSpacing60,
          Padding(
            padding: defaultPadding8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Absents = ${absentStudentList.length}', style: fontFamilyBold.size18, textAlign: TextAlign.left),
                Text('Total Present = ${presentStudentList.length}', style: fontFamilyBold.size18, textAlign: TextAlign.left),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Total Students = ${absentStudentList.length + presentStudentList.length}',
                      style: fontFamilyBold.size18,
                    ),
                    InkWell(
                      onTap: viewModel.saveStudentList,
                      child: const Box(
                        margin: EdgeInsets.only(left: 100),
                        height: 50,
                        width: 100,
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  StudentConfirmationViewModel viewModelBuilder(BuildContext context) => StudentConfirmationViewModel(cid, hid, subjectId, absentStudentList, presentStudentList);
}

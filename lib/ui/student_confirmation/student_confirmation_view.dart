import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/student_confirmation/slidetransition_widget/slide_trance.dart';
import 'package:workspace/ui/student_confirmation/student_confirmation_viewmodel.dart';
import 'package:workspace/ui/widgets/box.dart';

import '../../core/models/students_model.dart';
import '../widgets/circular_progress_indicator.dart';

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
  // final GetStudentResponse data;

  @override
  Widget builder(BuildContext context, StudentConfirmationViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor2699FB,
        leading: const Padding(padding: EdgeInsets.all(8.0), child: Text('') //Image.asset('assets/icons/confirm.png'),
            ),
        title: Text(
          '         Confirmation',
          style: fontFamilyBold.size20.white,
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            padding: defaultPadding20 + const EdgeInsets.only(bottom: 130),
            child: !viewModel.isBusy
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/absent.png',
                            width: 30,
                            height: 35,
                          ),
                          horizontalSpacing10,
                          Text(
                            'Absented students',
                            style: fontFamilyBold.size18.red,
                          ),
                          const Spacer(),
                          Box(
                              onTap: () => viewModel.setEnablePresent(!viewModel.isUpdatePresent),
                              margin: zeroPadding,
                              padding: defaultPadding8,
                              width: 70,
                              height: 30,
                              boxColor: viewModel.isUpdatePresent ? Colors.red.shade400 : Colors.cyan,
                              child: Text(
                                viewModel.isUpdatePresent ? "Done" : "Edit",
                                // "Edit",
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      verticalSpacing20,
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => SlideTranse(
                          child: Row(
                            children: [
                              Expanded(
                                child: Card(
                                    color: const Color.fromARGB(255, 178, 241, 180),
                                    child: Text(
                                      absentStudentList[index].studentName ?? '',
                                      style: fontFamilyMedium.size16,
                                    )),
                              ),
                              const Spacer(),
                              if (viewModel.isUpdatePresent)
                                Box(
                                    onTap: () => viewModel.setUpdatePresent(absentStudentList[index]),
                                    margin: zeroPadding,
                                    padding: defaultPadding8,
                                    width: 70,
                                    height: 30,
                                    boxColor: Colors.green.shade500,
                                    child: const Text(
                                      "Present",
                                      textAlign: TextAlign.center,
                                    )),
                            ],
                          ),
                        ),
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
                          Image.asset(
                            'assets/icons/present.png',
                            width: 30,
                            height: 35,
                          ),
                          horizontalSpacing10,
                          Text(
                            'Presented students',
                            style: fontFamilyBold.size18.color2699FB,
                          ),
                          const Spacer(),
                          Box(
                              onTap: () => viewModel.setEnableAbsent(!viewModel.isUpdateAbsent),
                              margin: zeroPadding,
                              padding: defaultPadding8,
                              width: 70,
                              height: 30,
                              boxColor: viewModel.isUpdateAbsent ? const Color.fromARGB(255, 178, 241, 180) : Colors.cyan,
                              child: Text(
                                viewModel.isUpdateAbsent ? "Done" : "Edit",
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                      verticalSpacing20,
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => SlideTranse(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Card(
                                      // color: Colors.green.withOpacity(0.1),
                                      child: Text(presentStudentList[index].studentName ?? '', style: fontFamilyMedium.size16))),
                              const Spacer(),
                              if (viewModel.isUpdateAbsent)
                                Box(
                                    onTap: () => viewModel.setUpdateAbsent(presentStudentList[index]),
                                    margin: zeroPadding,
                                    padding: defaultPadding8,
                                    width: 70,
                                    height: 30,
                                    boxColor: Colors.red.shade400,
                                    child: const Text(
                                      "Absent",
                                      textAlign: TextAlign.center,
                                    )),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => const Padding(
                          padding: defaultPadding8,
                          child: horizontalDivider,
                        ),
                        itemCount: presentStudentList.length,
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
          ),
          if (!viewModel.isBusy)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: appcolor2699FB),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  padding: defaultPadding20,
                  height: 140,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Total Absents = ${viewModel.absentStudentList.length}',
                            style: fontFamilyBold.size18,
                          ),
                          Text(
                            'Total Present = ${viewModel.presentStudentList.length}',
                            style: fontFamilyBold.size18,
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Students = ${viewModel.absentStudentList.length + viewModel.presentStudentList.length}',
                                style: fontFamilyBold.size18,
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (!viewModel.isUpdateAbsent)
                        if (!viewModel.isUpdatePresent)
                          Expanded(
                            child: InkWell(
                              onTap: viewModel.saveStudentList,
                              child: const Box(
                                margin: EdgeInsets.only(left: 60),
                                height: 50,
                                // width: 100,
                                child: Text(
                                  'Submit',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  StudentConfirmationViewModel viewModelBuilder(BuildContext context) => StudentConfirmationViewModel(cid, hid, subjectId, absentStudentList, presentStudentList);
}

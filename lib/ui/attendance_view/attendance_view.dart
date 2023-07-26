import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/attendance_view/attendance_viewmodel.dart';

import '../shared/styles.dart';
import '../widgets/circular_progress_indicator.dart';

class AttandanceView extends StatefulWidget {
  const AttandanceView({required this.cid, required this.hid, required this.sdate, super.key});

  @override
  State<AttandanceView> createState() => _AttandanceViewState();

  final int cid;
  final int hid;
  // final int subjectId;
  final DateTime sdate;
}

class _AttandanceViewState extends State<AttandanceView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AttendanceViewModel(widget.cid, widget.hid, widget.sdate),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appcolor2699FB,
              leading: Padding(
                padding: defaultPadding10,
                child: Image.asset('assets/icons/view.png'),
              ),
              actions: [IconButton(onPressed: () => viewModel.goToDashboard(), icon: const Icon(Icons.done))],
              title: Row(
                children: [
                  // Image.asset(
                  //   'assets/icons/view.png',
                  //   width: 30,
                  //   height: 35,
                  // ),
                  // horizontalSpacing20,
                  Text(
                    'View Attendance',
                    style: fontFamilyBold.size16.white,
                  ),
                ],
              ),
            ),
            body: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                if (!viewModel.isBusy)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: defaultPadding20,
                        height: 130,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Total Absents = ${viewModel.absentView.length}',
                                  style: fontFamilyBold.size18,
                                ),
                                Text(
                                  'Total Present = ${viewModel.presentView.length}',
                                  style: fontFamilyBold.size18,
                                ),
                                Text(
                                  'Total Students = ${viewModel.absentView.length + viewModel.presentView.length}',
                                  style: fontFamilyBold.size18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                SingleChildScrollView(
                  padding: defaultPadding20,
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
                              ],
                            ),
                            verticalSpacing20,
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(viewModel.absentView[index].name ?? ''), horizontalSpacing16, Text(viewModel.absentView[index].rollno ?? '')],
                              ),
                              separatorBuilder: (context, index) => const Padding(
                                padding: defaultPadding8,
                                child: horizontalDivider,
                              ),
                              itemCount: viewModel.absentView.length,
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
                              ],
                            ),
                            verticalSpacing20,
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Row(
                                children: [Text(viewModel.presentView[index].name ?? ''), horizontalSpacing16, Text(viewModel.presentView[index].rollno ?? '')],
                              ),
                              separatorBuilder: (context, index) => const Padding(
                                padding: defaultPadding8,
                                child: horizontalDivider,
                              ),
                              itemCount: viewModel.presentView.length,
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
                )
              ],
            ),
          );
        });
  }
}

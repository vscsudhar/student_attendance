import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dashboard/dashboard_viewmodel.dart';
import 'package:workspace/ui/dashboard/widgets/drawer_widget.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  final bool isVisible = true;

  @override
  State<DashboardView> createState() => DashboardviewState();
}

class DashboardviewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DashboardViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Image.asset(
                    'assets/icons/dashboard.png',
                    width: 24,
                    height: 24,
                  ),
                  horizontalSpacing20,
                  Text(
                    "Dashboard",
                    style: fontFamilyBold.size24.white,
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 200,
                      child: Image.memory(viewModel.image),
                      width: double.infinity,
                    ),
                    Box(
                        margin: zeroPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/teacher.png',
                                  width: 35,
                                  height: 35,
                                ),
                                horizontalSpacing20,
                                Text(
                                  'Staff attendance',
                                  style: fontFamilyBold.size20.white,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                viewModel.setLogIn();
                              },
                              child: !viewModel.isBusy
                                  ? Box(
                                      boxColor: viewModel.isStaffLoggedIn ? Colors.red : Colors.blueAccent,
                                      child: Text(
                                        viewModel.isStaffLoggedIn ? "LogOut" : "LogIn",
                                        style: fontFamilyRegular.size16.white,
                                        textAlign: TextAlign.center,
                                      ))
                                  : const Center(
                                      child: Padding(
                                      padding: defaultPadding20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )),
                            ),
                          ],
                        )),
                    verticalSpacing20,
                    InkWell(
                      onTap: () {
                        // if (viewModel.isStaffLoggedIn == true) {
                        //   viewModel.goToSection(viewModel.loginResponse);
                        // } else {
                        //   viewModel.Section();
                        // }
                        viewModel.goToSection(viewModel.loginResponse);
                      },
                      child: Box(
                          margin: zeroPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/group.png',
                                    width: 30,
                                    height: 35,
                                  ),
                                  horizontalSpacing20,
                                  Text(
                                    'student attendance',
                                    style: fontFamilyBold.size20.white,
                                  ),
                                ],
                              ),
                              verticalSpacing12,
                            ],
                          )),
                    ),
                    verticalSpacing20,
                    Box(
                        margin: zeroPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
              'assets/icons/announcement.png',
              width: 30,
              height: 35,
            ),
            horizontalSpacing20,
                                Text(
                                  'Announcement',
                                  style: fontFamilyBold.size20.white,
                                ),
                              ],
                            ),
                            verticalSpacing12,
                            ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () => viewModel.goToAnnouncementDetails(viewModel.annoncement[index]),
                                child: Text(
                                  viewModel.annoncement[index].title ?? 'N/A',
                                  style: fontFamilyMedium.size14.white70,
                                ),
                              ),
                              separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: horizontalDivider,
                              ),
                              itemCount: viewModel.annoncement.length,
                            )
                          ],
                        )),
                    verticalSpacing20,
                    InkWell(
                      onTap: () {
                        // if (viewModel.isStaffLoggedIn == true) {
                        //   viewModel.goToSection(viewModel.loginResponse);
                        // } else {
                        //   viewModel.section1();
                        // }
                      viewModel.goToViewSection(viewModel.loginResponse);

                      },
                      child: Box(
                          margin: zeroPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
              'assets/icons/studentview.png',
              width: 30,
              height: 35,
            ),
            horizontalSpacing20,
                                  Text(
                                    'student Attendance View',
                                    style: fontFamilyBold.size20.white,
                                  ),
                                ],
                              ),
                              verticalSpacing12,
                            ],
                          )),
                    ),
                  ]),
                ),
              ),
            ),
            drawer: const DrawerView(),
          );
        });
  }
}

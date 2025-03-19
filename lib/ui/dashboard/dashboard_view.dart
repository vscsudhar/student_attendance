import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dashboard/dashboard_viewmodel.dart';
import 'package:workspace/ui/dashboard/widgets/botton_navigation_bar.dart';
import 'package:workspace/ui/dashboard/widgets/drawer_widget.dart';
import 'package:workspace/ui/profiles/profile_view.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';
import 'package:workspace/ui/widgets/circular_progress_indicator.dart';

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
              backgroundColor: appcolor2699FB,
              // forceMaterialTransparency: true,
              title: Text(
                "Dashboard",
                style: fontFamilyBold.size24.white,
              ),
              leading: Padding(
                padding: defaultPadding10,
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileView())),
                  child: Image.asset('assets/icons/profile.png'),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 150,
                      child: Image.memory(
                        viewModel.image,
                        fit: BoxFit.fitHeight,
                      ),
                      width: double.infinity,
                    ),
                    verticalSpacing12,
                    Container(
                        padding: leftPadding10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            border: Border.all(color: appcolor2699FB)
                            // boxShadow: const <BoxShadow>[
                            //   BoxShadow(color: appcolor2699FB, offset: Offset(3, 3), blurRadius: 5, blurStyle: BlurStyle.solid),
                            // ],
                            ),
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
                                  style: fontFamilyBold.size20.color2699FB,
                                ),
                              ],
                            ),
                            verticalSpacing12,
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 65,
                                viewportFraction: 1,
                                autoPlay: true,
                                padEnds: false,
                              ),
                              items: viewModel.annoncement.map((announcement) {
                                return InkWell(
                                  onTap: () => viewModel
                                      .goToAnnouncementDetails(announcement),
                                  child: Padding(
                                    padding: leftPadding8 + rightPadding8,
                                    child: Text(
                                      announcement.title ?? 'N/A',
                                      selectionColor: appcolor2699FB,
                                      style:
                                          fontFamilyMedium.size14.color2699FB,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        )),
                    verticalSpacing20,
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
                                viewModel.staffLogin();
                              },
                              child: !viewModel.isBusy
                                  ? Box(
                                      boxColor: viewModel.isStaffLoggedIn
                                          ? Colors.red
                                          : Colors.blueAccent,
                                      child: Text(
                                        viewModel.isStaffLoggedIn
                                            ? "LogOut"
                                            : "LogIn",
                                        style: fontFamilyRegular.size16.white,
                                        textAlign: TextAlign.center,
                                      ))
                                  : Center(
                                      child: Padding(
                                      padding: defaultPadding20,
                                      child: AnimatedCircularProgressIndicator(
                                        color: Colors.white,
                                        backgroundColor: Colors.grey,
                                      ),

                                      // CircularProgressIndicator(
                                      //   color: Colors.white,
                                      //   backgroundColor: Colors.grey,
                                      // ),
                                    )),
                            ),
                          ],
                        )),
                    // verticalSpacing20,
                    // InkWell(
                    //   onTap: () {
                    //     // if (viewModel.isStaffLoggedIn == true) {
                    //     //   viewModel.goToSection(viewModel.loginResponse);
                    //     // } else {
                    //     //   viewModel.section();
                    //     // }
                    //     viewModel.goToSection(viewModel.loginResponse);
                    //   },
                    //   child: Box(
                    //       margin: zeroPadding,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Image.asset(
                    //                 'assets/icons/group.png',
                    //                 width: 30,
                    //                 height: 35,
                    //               ),
                    //               horizontalSpacing20,
                    //               Text(
                    //                 'student attendance',
                    //                 style: fontFamilyBold.size20.white,
                    //               ),
                    //             ],
                    //           ),
                    //           verticalSpacing12,
                    //         ],
                    //       )),
                    // ),
                    // verticalSpacing20,

                    // //verticalSpacing20,
                    // InkWell(
                    //   onTap: () {
                    //     //   if (viewModel.isStaffLoggedIn == true) {
                    //     //     viewModel.goToViewSection(viewModel.loginResponse);
                    //     //   } else {
                    //     //     viewModel.section1();
                    //     //   }
                    //     viewModel.goToViewSection(viewModel.loginResponse);
                    //   },
                    //   child: Box(
                    //       margin: zeroPadding,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Image.asset(
                    //                 'assets/icons/studentview.png',
                    //                 width: 30,
                    //                 height: 35,
                    //               ),
                    //               horizontalSpacing20,
                    //               Text(
                    //                 'student Attendance View',
                    //                 style: fontFamilyBold.size20.white,
                    //               ),
                    //             ],
                    //           ),
                    //           verticalSpacing12,
                    //         ],
                    //       )),
                    // ),
                    verticalSpacing20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Box(
                              margin: zeroPadding,
                              padding: const EdgeInsets.only(bottom: 12),
                              onTap: () => viewModel
                                  .goToSection(viewModel.loginResponse),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/group.png',
                                    width: 50,
                                    height: 60,
                                  ),
                                  Text(
                                    'student\nAttendance',
                                    style: fontFamilyBold.size18.white,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ),
                        horizontalSpacing20,
                        Expanded(
                          child: Box(
                              onTap: () => viewModel
                                  .goToViewSection(viewModel.loginResponse),
                              margin: zeroPadding,
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/studentview.png',
                                    width: 50,
                                    height: 60,
                                  ),
                                  horizontalSpacing20,
                                  Text(
                                    'student Attendance View',
                                    style: fontFamilyBold.size18.white,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
            drawer: const DrawerView(),
            bottomNavigationBar: const BottonNavigator(),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dashboard/dashboard_viewmodel.dart';
import 'package:workspace/ui/dashboard/widget_drawer.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  final bool isVisible = true;

  @override
  State<DashboardView> createState() => Ddashboard_viewVate();
}

class Ddashboard_viewVate extends State<DashboardView> {
  late bool isVisible = true;
  late bool isVisible1 = true;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DashboardViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Dashboard",
                style: fontFamilyBold.size24.white,
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    const SizedBox(
                      height: 200,
                      width: double.infinity,
                    ),
                    Box(
                        onTap: () => setState(() => isVisible = !isVisible1),
                        margin: zeroPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Staff attendance',
                              style: fontFamilyBold.size20.white,
                            ),
                            if (isVisible)
                              Box(
                                  onTap: () => setState(() => isVisible = !isVisible),
                                  boxColor: Colors.blueAccent,
                                  child: Text(
                                    "Login",
                                    style: fontFamilyRegular.size16.white,
                                    textAlign: TextAlign.center,
                                  )),
                            if (isVisible1)
                              Box(
                                  onTap: () => setState(() => isVisible1 = !isVisible1),
                                  boxColor: Colors.red,
                                  child: Text(
                                    "LogOut",
                                    style: fontFamilyRegular.size16.white,
                                    textAlign: TextAlign.center,
                                  )),
                            verticalSpacing12,
                          ],
                        )),
                    verticalSpacing20,
                    Box(
                        onTap: viewModel.goToSection,
                        margin: zeroPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'student attendance',
                              style: fontFamilyBold.size20.white,
                            ),
                            verticalSpacing12,
                          ],
                        )),
                    verticalSpacing20,
                    Box(
                        margin: zeroPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Announcement',
                              style: fontFamilyBold.size20.white,
                            ),
                            verticalSpacing12,
                            ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Text(
                                'happy pongal....',
                                style: fontFamilyItalic.size14.white54,
                              ),
                              separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: horizontalDivider,
                              ),
                              itemCount: 5,
                            )
                          ],
                        )),
                    verticalSpacing20,
                    Box(
                        onTap: viewModel.goToSection,
                        margin: zeroPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'student Iist',
                              style: fontFamilyBold.size20.white,
                            ),
                            verticalSpacing12,
                          ],
                        )),
                  ]),
                ),
              ),
            ),
            drawer: const DrawerView(),
          );
        });
  }
}

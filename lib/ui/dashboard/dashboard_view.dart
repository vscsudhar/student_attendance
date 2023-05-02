import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dashboard/dashboard_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => Ddashboard_viewVate();
}

class Ddashboard_viewVate extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DashboardViewmodel(),
      builder: (context,viewModel,
      child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Dashboard",
              style: TextStyle(),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Box(
                    margin: zeroPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Staff attendance',
                          style: fontFamilyBold.size20.white,
                        ),
                        verticalSpacing12,
                      ],
                    )),
                verticalSpacing20,
                Box(
                    onTap: viewModel.goToStudents,
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
                    ))
              ]),
            ),
          ),
        );
      }
    );
  }
}

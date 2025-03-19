import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';

import '../../profiles/profile_view.dart';
import '../dashboard_viewmodel.dart';

class BottonNavigator extends StatefulWidget {
  const BottonNavigator({super.key});

  @override
  State<BottonNavigator> createState() => _BottonNavigatorState();
}

class _BottonNavigatorState extends State<BottonNavigator> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DashboardViewmodel(),
      builder: (context, viewModel, child) => Padding(
        padding: defaultPadding20,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: appcolor2699FB),
          child: Padding(
            padding: defaultPadding12,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: appcolor2699FB,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(.60),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              elevation: 0,
              onTap: (value) {
                // Respond to item press.
              },
              items: [
                BottomNavigationBarItem(
                  label: ('Dashboard'),
                  icon: InkWell(
                    onTap: () => viewModel.goToDashboard(),
                    child: Image.asset(
                      'assets/icons/dashboard.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: ('Profile'),
                  icon: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileView())),
                    child: Image.asset(
                      'assets/icons/profile.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: ('Info'),
                  icon: InkWell(
                    onTap: () => showBottomSheet1(context),
                    child: const Icon(Icons.info_outline),
                  ),
                ),
                BottomNavigationBarItem(
                  label: ('Logout'),
                  icon: InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("LogOut"),
                            content: const Text('Are you sure to want Logout?'),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.redAccent,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    viewModel.logout();
                                  },
                                  icon: const Icon(
                                    Icons.done,
                                    color: appcolor2699FB,
                                  ))
                            ],
                          );
                        }),
                    child: Image.asset(
                      'assets/icons/logout.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheet1(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.grey.shade100,
      // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeader(),
            Expanded(
                child: Padding(
              padding: defaultPadding20,
              child: Column(
                children: [
                  Text(
                    'Morning',
                    style: fontFamilyBold.size18,
                  ),
                  verticalSpacing20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LoginTime: ',
                        style: fontFamilyBold.size18.color2699FB,
                      ),
                      Text(
                        '${DateTime.now()}'.replaceAll('00:00:00.000000', ''),
                        style: fontFamilyMedium.size16,
                      )
                    ],
                  ),
                  verticalSpacing12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LoginOut: ',
                        style: fontFamilyBold.size18.color2699FB,
                      ),
                      Text(
                        '${DateTime.now()}'.replaceAll('00:00:00.000000', ''),
                        style: fontFamilyMedium.size16,
                      ),
                    ],
                  ),
                  verticalSpacing20,
                  horizontalDivider,
                  Text(
                    'Break',
                    style: fontFamilyBold.size18,
                  ),
                  verticalSpacing20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LoginTime: ',
                        style: fontFamilyBold.size18.color2699FB,
                      ),
                      Text(
                        '${DateTime.now()}'.replaceAll('00:00:00.000000', ''),
                        style: fontFamilyMedium.size16,
                      ),
                    ],
                  ),
                  verticalSpacing20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LoginOut: ',
                        style: fontFamilyBold.size18.color2699FB,
                      ),
                      Text(
                        '${DateTime.now()} ',
                        style: fontFamilyMedium.size16,
                      )
                    ],
                  ),
                ],
              ),
            )),
          ],
        );
      },
    );
  }

  Widget buildHeader() {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius),
      color: appcolor2699FB,
      padding: defaultPadding8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Staff Login Info', style: fontFamilyBold.size16),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

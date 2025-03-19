import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dashboard/dashboard_viewmodel.dart';
import 'package:workspace/ui/profiles/profile_view.dart';
import 'package:workspace/ui/shared/styles.dart';

class DrawerView extends ViewModelWidget<DashboardViewmodel> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context, DashboardViewmodel viewModel) {
    return Drawer(
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          buildHeader(context, viewModel.userName, viewModel.empId),
          buildMenuItems(context, viewModel),
        ]),
      ),
    );
  }

  Widget buildHeader(BuildContext context, String userName, String empId) =>
      Container(
        color: appcolor2699FB,
        padding: defaultPadding20,
        child: Column(children: [
          const CircleAvatar(
            radius: 45,
          ),
          verticalSpacing10,
          Text(userName, style: fontFamilyBold.size18.white),
          Text(empId, style: fontFamilyBold.size16.white54)
          //  Text('$userName.com', style: fontFamilyBold.size14.white54),
        ]),
      );

  Widget buildMenuItems(BuildContext context, DashboardViewmodel viewModel) =>
      Column(
        children: [
          ListTile(
              leading: Image.asset(
                'assets/icons/dashboard.png',
                width: 30,
                height: 30,
              ),
              title: Text(
                "Dashboard",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/group.png',
                width: 30,
                height: 30,
              ),
              title: Text(
                "Profile",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileView()));
              }),
          ListTile(
            leading: Image.asset(
              'assets/icons/logout.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              "Logout",
              style: fontFamilyBold.size16,
            ),
            onTap: () {
              showDialog(
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
                  });
            },
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/dashboard/dashboard_view.dart';
import 'package:workspace/ui/dashboard/dashboard_viewmodel.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/shared/styles.dart';

class DrawerView1 extends ViewModelWidget<DashboardViewmodel> {
  const DrawerView1({super.key});

  @override
  Widget build(BuildContext context, DashboardViewmodel viewModel) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          buildHeader(context, viewModel.userName),
          buildMenuItems(context, viewModel),
        ]),
      ),
    );
  }

  Widget buildHeader(BuildContext context, String userName) => Container(
        color: appcolor2699FB,
        padding: defaultPadding20,
        child: Column(children: [
          const CircleAvatar(
            radius: 45,
          ),
          verticalSpacing10,
          Text(userName, style: fontFamilyBold.size18.white),
          Text('$userName.in', style: fontFamilyBold.size14.white54),
        ]),
      );

  Widget buildMenuItems(BuildContext context, DashboardViewmodel viewModel) => Column(
        children: [
          ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                "Dashboard",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardView(loginResponse: viewModel.loginResponse)));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardView()));
              }),
          ListTile(
              leading: const Icon(
                Icons.person,
                color: appcolor2699FB,
              ),
              title: Text(
                "Profile",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
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

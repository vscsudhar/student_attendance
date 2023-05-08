import 'package:flutter/material.dart';
import 'package:workspace/ui/dashboard/dashboard_view.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/profiles/profile_view.dart';
import 'package:workspace/ui/shared/styles.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          buildHeader(context),
          buildMenuItems(context),
        ]),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: appcolor2699FB,
        padding: defaultPadding20,
        child: Column(children: [
          const CircleAvatar(
            radius: 45,
          ),
          verticalSpacing10,
          Text('sudhar', style: fontFamilyBold.size18.white),
          Text('vscsudhar.com', style: fontFamilyBold.size14.white54),
        ]),
      );
  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                "Dashboard",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileView()));
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

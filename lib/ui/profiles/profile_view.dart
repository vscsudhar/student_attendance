import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/profiles/profile_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';

import 'widget_drawer1/widget_drawer1.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appcolor2699FB,
            title: const Text('Profile'),
            elevation: 0,
          ),
          body: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 300,
                child: Icon(Icons.account_circle, size: 200, color: Colors.black),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                    child: Text('Full Name:'),
                  ),
                  Text('sudharsan ')
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
                    child: Text('User Id:'),
                  ),
                  Text('1234')
                ],
              ),
              Box(
                  child: Text(
                'Chage Password',
                style: fontFamilyRegular.size16,
                textAlign: TextAlign.center,
              )),
              verticalSpacing10,
              Box(
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
                child: Text(
                  'LogOut',
                  textAlign: TextAlign.center,
                  style: fontFamilyRegular.size16,
                ),
                boxColor: Colors.red,
              )
            ],
          ),
          drawer: const DrawerView1(),
        );
      },
    );
  }
}

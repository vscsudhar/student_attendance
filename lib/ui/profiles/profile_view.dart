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
          body: ListView(
            padding: defaultPadding20,
            children: [
              const CircleAvatar(
                minRadius: 70,
                maxRadius: 150,
                foregroundImage: NetworkImage('https://reqres.in/img/faces/1-image.jpg'),
              ),
              verticalSpacing16,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Full Name:'), Text('sudharsan ')],
              ),
              verticalSpacing20,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('User Id:'), Text('1234')],
              ),
              Column(
                children: [
                  Box(
                      onTap: () => viewModel.goToChangepassword(),
                      width: 155,
                      child: Text(
                        'Chage Password',
                        style: fontFamilyRegular.size16,
                        textAlign: TextAlign.center,
                      )),
                  Box(
                    width: 90,
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
            ],
          ),
          drawer: const DrawerView1(),
        );
      },
    );
  }
}

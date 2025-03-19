import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/profiles/profile_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';

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
                  backgroundImage: AssetImage('assets/icons/profile.png')),
              verticalSpacing16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Full Name:'),
                  Text(
                    viewModel.userName,
                    style: fontFamilyMedium.size16,
                  ),
                ],
              ),
              verticalSpacing20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('User Id:'),
                  Text(
                    viewModel.empId,
                    style: fontFamilyMedium.size16,
                  ),
                ],
              ),
              verticalSpacing20,
              Column(
                children: [
                  GestureDetector(
                    onTap: () => viewModel.goToChangepassword(),
                    child: Container(
                      width: 155,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Change Password',
                        style: fontFamilyRegular.size16
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  verticalSpacing16,
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Log Out"),
                            content:
                                const Text('Are you sure you want to log out?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginView()));
                                },
                                child: const Text(
                                  'Log Out',
                                  style: TextStyle(color: appcolor2699FB),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'Log Out',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //drawer: const DrawerView1(),
        );
      },
    );
  }
}

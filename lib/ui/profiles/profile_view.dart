import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/profiles/profile_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';

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
          ),
          body: Container(
            padding: defaultPadding10,
            child: Column(children: const [
              Icon(Icons.account_circle, size: 200, color: Colors.black),
              verticalSpacing10,
              Center(child: Text('Full Name: sudharsan')),
              verticalSpacing10,
              Text('User Id: 1234'),
              verticalSpacing10,
            ]),
          ),
          drawer: const DrawerView1(),
        );
      },
    );
  }
}

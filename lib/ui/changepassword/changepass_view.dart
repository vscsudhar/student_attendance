import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../shared/styles.dart';
import '../widgets/box.dart';
import '../widgets/text_field1.dart';
import 'changepass_viewmodel.dart';

class ChangepassView extends StatefulWidget {
  const ChangepassView({super.key});

  @override
  State<ChangepassView> createState() => _ChangepassViewState();
}

class _ChangepassViewState extends State<ChangepassView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ChangepassViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
          elevation: 0,
        ),
        body: Padding(
          padding: defaultPadding20,
          child: Column(
            children: [
              Card(
                child: Text(
                  viewModel.userName,
                  style: fontFamilyBold.color2699FB.size16,
                ),
              ),
              verticalSpacing60,
              const TextField1(
                  obscureText: true, hintText: 'Enter New Password'),
              verticalSpacing20,
              const TextField1(
                obscureText: false,
                hintText: 'ReEnter Password',
              ),
              verticalSpacing20,
              const Box(
                  width: 120,
                  child: Text('Submit',
                      textAlign: TextAlign.center, style: fontFamilyRegular))
            ],
          ),
        ),
      ),
    );
  }
}

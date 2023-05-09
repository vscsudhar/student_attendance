import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/login/login_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';
import 'package:workspace/ui/widgets/button.dart';
import 'package:workspace/ui/widgets/text_field1.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Form(
          key: _formKey,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: defaultPadding20,
                child: Column(children: [
                  verticalSpacing60,
                  verticalSpacing20,
                  Text(
                    "Login",
                    style: fontFamilyRegular.size26.color2699FB,
                  ),
                  const TextField1(
                    hintText: 'USERNAME',
                  ),
                  verticalSpacing10,
                  const TextField1(
                    hintText: 'PASSWORD',
                  ),
                  verticalSpacing10,
                  verticalSpacing20,
                  Button(
                    name: 'Login',
                    onPressed: () {
                      if (viewModel.atLocation) {
                        viewModel.goToDashboard();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                
                                title: Text(
                                  'Hello Sudhar...',
                                  textAlign: TextAlign.center,
                                ),
                                content: Text('Succesfully LogedIn....'),
                              
                                
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text('You are not inside the school campus'),
                                content: Text('kindly ensure your location and login again...'),
                                actions: [
                                  Box(
                                      boxColor: appcolor2699FB,
                                      child: Text(
                                        'Cancel',
                                        style: fontFamilyRegular,
                                        textAlign: TextAlign.center,
                                      ))
                                ],
                              );
                            });
                        log('you are not inside the school campus,\nkindly ensure your location and login again...');
                      }
                    },
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/login/login_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/button.dart';
import 'package:workspace/ui/widgets/text_field1.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
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
                  TextField1(
                    initialValue: 'eve.holt@reqres.in',
                    hintText: 'USERNAME',
                    validator: (val) => val == null || val.isEmpty ? 'email is required' : null,
                    onSaved: (email) => viewModel.loginRequest.email = email,
                    
                  ),
                  verticalSpacing10,
                  TextField1(
                    initialValue: 'cityslicka',
                    hintText: 'PASSWORD',
                    validator: (val) => val == null || val.isEmpty ? 'password is required' : null,
                    onSaved: (password) => viewModel.loginRequest.password = password,
                  ),
                  verticalSpacing10,
                  verticalSpacing20,
                  Button(
                    name: 'Login',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        viewModel.login();
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

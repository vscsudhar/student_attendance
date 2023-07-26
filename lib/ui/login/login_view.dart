import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/login/login_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/button1.dart';
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
        body: SingleChildScrollView(
          child: Form(
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
                      style: fontFamilyBold.size30.color2699FB,
                    ),
                    Padding(
                      padding: defaultPadding20,
                      child: Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'), // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextField1(
                      hintText: 'User ID',
                      //initialValue: 'college',
                      obscureText: false,
                      validator: (val) => val == null || val.isEmpty ? 'email is required' : null,
                      onSaved: (userId) => viewModel.loginRequest.userId = userId,
                    ),
                    verticalSpacing10,
                    TextField1(
                      obscureText: true,
                      //  initialValue: '123',
                      hintText: 'Password',
                      validator: (val) => val == null || val.isEmpty ? 'password is required' : null,
                      onSaved: (password) => viewModel.loginRequest.password = password,
                    ),
                    verticalSpacing10,
                    verticalSpacing20,
                    Button1(
                      title: 'Login',
                      busy: viewModel.isBusy,
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          viewModel.userLogin();
                        }
                      },
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

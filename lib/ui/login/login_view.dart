import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/login/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "LOGIN",
            style: TextStyle(),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                "Login",
                style: TextStyle(),
              ),
              TextField(),
              SizedBox(
                height: 10,
              ),
              TextField(),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: viewModel.goToDashboard, child: Text("Login"))
            ]),
          ),
        ),
      ),
    );
  }
}

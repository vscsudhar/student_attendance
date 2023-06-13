import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/splash/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplasViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: Text(
            'Splash',
            style: fontFamilyBold.size22.color2699FB,
          ),
        ),
      ),
    );
  }
}

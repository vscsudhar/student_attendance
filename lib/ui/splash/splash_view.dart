import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white10, Colors.blue],
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/logo.jpg'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}

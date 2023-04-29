import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => Ddashboard_viewVate();
}

class Ddashboard_viewVate extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "Dashboard",
              style: TextStyle(),
            ),
          ]),
        ),
      ),
    );
  }
}

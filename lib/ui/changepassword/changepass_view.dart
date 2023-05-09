import 'package:flutter/material.dart';
import 'package:workspace/ui/shared/styles.dart';
import 'package:workspace/ui/widgets/box.dart';
import 'package:workspace/ui/widgets/text_field1.dart';

class ChangepassView extends StatefulWidget {
  const ChangepassView({super.key});

  @override
  State<ChangepassView> createState() => _ChangepassViewState();
}

class _ChangepassViewState extends State<ChangepassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        elevation: 0,
      ),
      body: Column(
        children: const [
          Padding(
            padding: defaultPadding20,
            child: Text('Hi your enter the Change password section....'),
          ),
          Card(
            child: Text(
              'Hello sudhar',
            ),
          ),
          verticalSpacing60,
          TextField1(hintText: 'Enter New Password'),
          verticalSpacing20,
          TextField1(
            hintText: 'ReEnter Password',
          ),
          verticalSpacing20,
          Box(width: 120, child: Text('Submit', textAlign: TextAlign.center, style: fontFamilyRegular))
        ],
      ),
    );
  }
}

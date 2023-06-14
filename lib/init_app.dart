import 'package:flutter/material.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/ui/setup_dialog_ui.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  setupDialogUi();
}

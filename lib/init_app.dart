import 'package:workspace/service/locator.dart';
import 'package:workspace/ui/setup_dialog_ui.dart';

Future<void> initApp() async {
  await setUpLocator();
  setupDialogUi();
}

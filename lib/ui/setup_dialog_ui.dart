import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/ui/widgets/dialogs/error_dialog.dart';

import '../core/enum/dialog_type.dart';

import '../service/locator.dart';
import 'widgets/dialogs/message_dialog.dart';

void setupDialogUi() {
  locator<DialogService>().registerCustomDialogBuilders(
    {
      null: (context, dialogRequest, completer) => MessageDialog(
            title: dialogRequest.title,
            description: dialogRequest.description,
            mainButtonTitle: dialogRequest.mainButtonTitle,
            onMainButtonClick: () => completer(
              DialogResponse(confirmed: true),
            ),
          ),
      DialogType.error: (context, dialogRequest, completer) => ErrorDialog(
            title: dialogRequest.title,
            description: dialogRequest.description,
            mainButtonTitle: dialogRequest.mainButtonTitle,
            onMainButtonClick: () => completer(
              DialogResponse(confirmed: true),
            ),
          ),
    },
  );
}

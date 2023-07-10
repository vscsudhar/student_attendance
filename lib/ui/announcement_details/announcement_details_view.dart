import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/announcement_details/announcement_details_viewmodel.dart';
import 'package:workspace/ui/shared/styles.dart';

import '../../core/models/login_model.dart';

class AnnouncementDetailsView extends StatefulWidget {
  const AnnouncementDetailsView({required this.annoncement, super.key});

  final Annoncement annoncement;

  @override
  State<AnnouncementDetailsView> createState() => _AnnouncementDetailsViewState();
}

class _AnnouncementDetailsViewState extends State<AnnouncementDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AnnouncementDetailsViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/announcement.png',
                      width: 30,
                      height: 35,
                    ),
                    horizontalSpacing10,
                    Text(
                      'Announcement Details',
                      style: fontFamilyBold.size24.white,
                    ),
                  ],
                ),
              ),
              body: ListView(
                padding: defaultPadding20,
                children: [
                  Text(
                    widget.annoncement.title ?? '',
                    style: fontFamilyBold.size18.color2699FB,
                  ),
                  verticalSpacing20,
                  horizontalDivider,
                  verticalSpacing20,
                   Text(
                    widget.annoncement.details ?? '',
                    style: fontFamilyRegular.size14.color2699FB,
                  ),
                ],
              ),
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/section/section_viewmodel.dart';
import 'package:workspace/ui/section/widgets/drop_down_widget.dart';
import 'package:workspace/ui/shared/styles.dart';

import '../widgets/button1.dart';

class SectionView extends StatefulWidget {
  const SectionView({super.key});

  @override
  State<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SectionViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Section',
              style: fontFamilyBold.size24.white,
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: defaultPadding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropDownWidget(
                        title: 'Class',
                        dropDownList: viewModel.classList,
                      ),
                      verticalSpacing16,
                      DropDownWidget(
                        title: 'Year',
                        dropDownList: viewModel.yearList,
                      ),
                      verticalSpacing16,
                      DropDownWidget(
                        title: 'Section',
                        dropDownList: viewModel.sectionlist,
                      ),
                      verticalSpacing16,
                      DropDownWidget(
                        title: 'Subject',
                        dropDownList: viewModel.subjectList,
                      ),
                      verticalSpacing16,
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: SafeArea(
                    top: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: defaultPadding8,
                          child: Button1(
                            title: 'Submit',
                            busy: viewModel.isBusy,
                            onTap: () => viewModel.getstudents(),
                          ),
                        ),
                        verticalSpacing20,
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}

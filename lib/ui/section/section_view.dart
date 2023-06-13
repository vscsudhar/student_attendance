import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/ui/section/section_viewmodel.dart';
import 'package:workspace/ui/section/widgets/drop_down_widget.dart';
import 'package:workspace/ui/shared/styles.dart';

import '../widgets/button1.dart';

class SectionView extends StatefulWidget {
  const SectionView({required this.loginResponse, super.key});

  final LoginResponse? loginResponse;

  @override
  State<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SectionViewModel(widget.loginResponse),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Section',
              style: fontFamilyBold.size24.white,
            ),
          ),
          body: CustomScrollView(
            key: _formKey,
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
                        validator: (val) => val == null || val.isEmpty ? 'Please select the Class' : null,
                        
                      ),
                      verticalSpacing16,
                      DropDownWidget(
                        title: 'Year',
                        dropDownList: viewModel.yearList,
                        validator: (val) => val == null || val.isEmpty ? 'Please Select the Year' : null,
                      ),
                      verticalSpacing16,
                      DropDownWidget(
                        title: 'Section',
                        dropDownList: viewModel.sectionlist,
                        validator: (val) => val == null || val.isEmpty ? 'Please Select the Section' : null,
                      ),
                      verticalSpacing16,
                      DropDownWidget(
                        title: 'Session',
                        dropDownList: viewModel.subjectList,
                        validator: (val) => val == null || val.isEmpty ? 'Please Select the Session' : null,
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
                            onTap: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState?.save();
                                viewModel.getstudents();
                              }
                            }, //viewModel.getstudents(),
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

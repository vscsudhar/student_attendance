import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/enum/busy_objects.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/ui/section/section_viewmodel.dart';
import 'package:workspace/ui/section/widgets/drop_down_widget.dart';
import 'package:workspace/ui/shared/styles.dart';

import '../widgets/button1.dart';
import '../widgets/circular_progress_indicator.dart';

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
            backgroundColor: appcolor2699FB,
            title: Row(
              children: [
                Image.asset(
                  'assets/icons/list3.png',
                  width: 30,
                  height: 35,
                ),
                horizontalSpacing20,
                Text(
                  'Section',
                  style: fontFamilyBold.size24.white,
                ),
              ],
            ),
          ),
          body: !viewModel.isBusy
              ? SafeArea(
                  child: CustomScrollView(
                    key: _formKey,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: defaultPadding20 +
                              defaultPadding20 -
                              topPadding20 -
                              leftPadding10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropDownWidget(
                                title: 'Class',
                                selectedValue: viewModel.classClass,
                                dropDownList: viewModel.classList,
                                validator: viewModel.selectClassName,
                              ),
                              verticalSpacing16,
                              if (viewModel.classClass != null)
                                DropDownWidget(
                                  title: 'Year',
                                  selectedValue: viewModel.year,
                                  dropDownList: viewModel.yearsList,
                                  validator: viewModel.selectYearName,
                                ),
                              verticalSpacing16,
                              if (viewModel.year != null)
                                DropDownWidget(
                                  title: 'Section',
                                  selectedValue: viewModel.section,
                                  dropDownList: viewModel.sectionsList,
                                  validator: viewModel.selectSectionName,
                                ),
                              verticalSpacing16,
                              if (viewModel.section != null)
                                DropDownWidget(
                                  title: 'Hour',
                                  selectedValue: viewModel.hours,
                                  dropDownList: viewModel.hourlist,
                                  validator: viewModel.selectHourName,
                                ),
                              verticalSpacing16,
                              Stack(
                                children: [
                                  if (viewModel
                                      .busy(BusyObjects.studentDetails))
                                    Center(
                                        child: Padding(
                                      padding: defaultPadding20,
                                      child: AnimatedCircularProgressIndicator(
                                        color: Colors.white,
                                        backgroundColor: appcolor2699FB,
                                      ),

                                      // CircularProgressIndicator(
                                      //   color: Colors.white,
                                      //   backgroundColor: Colors.grey,
                                      // ),
                                    )),
                                  if (viewModel.subjectList.isNotEmpty)
                                    DropDownWidget(
                                      title: 'Subjects',
                                      selectedValue: viewModel.subject,
                                      dropDownList: viewModel.subjectList,
                                      validator: viewModel.selectSubject,
                                    ),
                                ],
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
                                if (viewModel.isvalid)
                                  Padding(
                                    padding: defaultPadding8,
                                    child: Button1(
                                      title: 'Submit',
                                      busy: viewModel.isBusy,
                                      onTap: () {
                                        // if (_formKey.currentState?.validate() ?? false) {
                                        // _formKey.currentState?.save();
                                        viewModel.goToStudent();
                                        // }
                                      }, //viewModel.getstudents(),
                                    ),
                                  ),
                                verticalSpacing20,
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              : Center(
                  child: Padding(
                  padding: defaultPadding20,
                  child: AnimatedCircularProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.grey,
                  ),
                )),
        );
      },
    );
  }
}

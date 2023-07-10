import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/view_section/view_section_viewmodel.dart';

import '../../core/enum/busy_objects.dart';
import '../../core/models/login_model.dart';
import '../section/widgets/drop_down_widget.dart';
import '../shared/styles.dart';
import '../widgets/button1.dart';

class ViewSection extends StatefulWidget {
  const ViewSection({required this.loginResponse, super.key});

  final LoginResponse? loginResponse;

  @override
  State<ViewSection> createState() => _ViewSectionState();
}

class _ViewSectionState extends State<ViewSection> {
  DateTime _sdate = DateTime.now();
  DateTime get sdate => _sdate;

  final _formKey = GlobalKey<FormState>();
  DatePickerController? controller;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewSectionModel(widget.loginResponse),
      builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset(
                  'assets/icons/list3.png',
                  width: 30,
                  height: 35,
                ),
                horizontalSpacing10,
                Text(
                  'View Attendance Section',
                  style: fontFamilyBold.size20.white,
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
                          padding: defaultPadding20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMEd().format(DateTime.now()),
                                style: fontFamilyBold.color2699FB.size18,
                              ),
                              Container(
                                margin: defaultPadding10,
                                child: DatePicker(
                                  initialSelectedDate: DateTime.now(),
                                  DateTime.now(),
                                  height: 100,
                                  width: 50,
                                  selectionColor: appcolor2699FB,
                                  selectedTextColor: Colors.white,
                                  dateTextStyle: fontFamilyMedium.size18,
                                  onDateChange: (date) {
                                    _sdate = date;
                                  },
                                ),
                              ),
                              Padding(
                                padding: defaultPadding10,
                                child: DropDownWidget(
                                  title: 'Class',
                                  selectedValue: viewModel.classClass,
                                  dropDownList: viewModel.classList,
                                  validator: viewModel.selectClassName,
                                ),
                              ),
                              verticalSpacing16,
                              if (viewModel.classClass != null)
                                Padding(
                                  padding: defaultPadding10,
                                  child: DropDownWidget(
                                    title: 'Year',
                                    selectedValue: viewModel.year,
                                    dropDownList: viewModel.yearsList,
                                    validator: viewModel.selectYearName,
                                  ),
                                ),
                              verticalSpacing16,
                              if (viewModel.year != null)
                                Padding(
                                  padding: defaultPadding10,
                                  child: DropDownWidget(
                                    title: 'Section',
                                    selectedValue: viewModel.section,
                                    dropDownList: viewModel.sectionsList,
                                    validator: viewModel.selectSectionName,
                                  ),
                                ),
                              verticalSpacing16,
                              if (viewModel.section != null)
                                Padding(
                                  padding: defaultPadding10,
                                  child: DropDownWidget(
                                    title: 'Hour',
                                    selectedValue: viewModel.hours,
                                    dropDownList: viewModel.hourlist,
                                    validator: viewModel.selectHourName,
                                  ),
                                ),
                              verticalSpacing16,
                              Stack(
                                children: [
                                  if (viewModel.busy(BusyObjects.studentDetails))
                                    const Center(
                                      child: Padding(
                                        padding: topPadding20,
                                        child: CircularProgressIndicator(
                                          color: appcolor2699FB,
                                        ),
                                      ),
                                    ),
                                  if (viewModel.subjectList.isNotEmpty)
                                    Padding(
                                      padding: defaultPadding10,
                                      child: DropDownWidget(
                                        title: 'Subjects',
                                        selectedValue: viewModel.subject,
                                        dropDownList: viewModel.subjectList,
                                        validator: viewModel.selectSubject,
                                      ),
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
                                      title: 'View Student Attendance',
                                      busy: viewModel.isBusy,
                                      onTap: () {
                                        // if (_formKey.currentState?.validate() ?? false) {
                                        // _formKey.currentState?.save();
                                        viewModel.goToAttendanceView(viewModel.cid, viewModel.hid, sdate);
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
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}

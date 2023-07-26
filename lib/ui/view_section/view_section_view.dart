import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/view_section/view_section_viewmodel.dart';

import '../../core/enum/busy_objects.dart';
import '../../core/models/login_model.dart';
import '../section/widgets/drop_down_widget.dart';
import '../shared/styles.dart';
import '../widgets/button1.dart';
import '../widgets/circular_progress_indicator.dart';

class ViewSection extends StatefulWidget {
  const ViewSection({required this.loginResponse, super.key});

  final LoginResponse? loginResponse;

  @override
  State<ViewSection> createState() => _ViewSectionState();
}

class _ViewSectionState extends State<ViewSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewSectionModel(widget.loginResponse),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: appcolor2699FB,
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
        body: 
        // !viewModel.isBusy
        //     ? 
            SafeArea(
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
                            Padding(
                              padding: leftPadding10,
                              child: Text(
                                'Select Date',
                                style: fontFamilyBold.size14,
                              ),
                            ),
                            InkWell(
                              onTap: () => viewModel.selectDate(context),
                              child: Container(
                                margin: const EdgeInsets.only(top: 12) + leftPadding10 + rightPadding10,
                                padding: defaultPadding12,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      offset: Offset(3, 3),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(DateFormat.yMMMEd().format(viewModel.sdate)),
                                    const Icon(Icons.calendar_today),
                                  ],
                                ),
                              ),
                            ),
                            // const SizedBox(height: 16),
                            // Text(
                            //   'Selected Date: ${sdate != null ? DateFormat.yMMMEd().format(sdate) : "No date selected"}',
                            // ),
                            // Container(
                            //   margin: defaultPadding10,
                            //   child: DatePicker(
                            //     initialSelectedDate: DateTime.now(),
                            //     DateTime.now(),
                            //     height: 100,
                            //     width: 50,
                            //     selectionColor: appcolor2699FB,
                            //     selectedTextColor: Colors.white,
                            //     dateTextStyle: fontFamilyMedium.size18,
                            //     onDateChange: (date) {
                            //       _sdate = date;
                            //     },
                            //   ),
                            // ),
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
                            // Stack(
                              // children: [
                                // if (viewModel.busy(BusyObjects.studentDetails))
                                //    Center(
                                //       child: Padding(
                                //       padding: defaultPadding20,
                                //       child: AnimatedCircularProgressIndicator(
                                //         color: Colors.white,
                                //         backgroundColor: Colors.grey,
                                //       ),

                                      // CircularProgressIndicator(
                                      //   color: Colors.white,
                                      //   backgroundColor: Colors.grey,
                                      // ),
                                    // )),
                                // if (viewModel.subjectList.isNotEmpty)
                                //   Padding(
                                //     padding: defaultPadding10,
                                //     child: DropDownWidget(
                                //       title: 'Subjects',
                                //       selectedValue: viewModel.subject,
                                //       dropDownList: viewModel.subjectList,
                                //       validator: viewModel.selectSubject,
                                //     ),
                                //   ),
                              // ],
                            // ),
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
                              if(viewModel.hours != null)
                              // if (viewModel.isvalid)
                                Padding(
                                  padding: defaultPadding8,
                                  child: Button1(
                                    title: 'View Student Attendance',
                                    busy: viewModel.isBusy,
                                    onTap: () {
                                      // if (_formKey.currentState?.validate() ?? false) {
                                      // _formKey.currentState?.save();
                                      viewModel.goToAttendanceView(viewModel.cid, viewModel.hid, viewModel.sdate);
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
              ),
            // : Center(
            //     child: Padding(
            //     padding: defaultPadding20,
            //     child: AnimatedCircularProgressIndicator(
            //       color: Colors.white,
            //       backgroundColor: Colors.grey,
            //     ),

                // CircularProgressIndicator(
                //   color: Colors.white,
                //   backgroundColor: Colors.grey,
                // ),
              ));
      
    
  }
}

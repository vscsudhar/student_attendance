import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/student_details/studentsdetails_viewmodel.dart';

class StudentDetailsView extends StatefulWidget {
  const StudentDetailsView({
    required this.Id,
    super.key,
  });

  final int Id;

  @override
  State<StudentDetailsView> createState() => _StudentDetailsViewState();
}

class _StudentDetailsViewState extends State<StudentDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StudentDetailsViewModel(widget.Id),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
    );
  }
}

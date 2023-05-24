import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/ui/shared/styles.dart';
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
        body: SingleChildScrollView(
            child: !viewModel.isBusy
                ? Column(children: [
                    CircleAvatar(
                      maxRadius: 80,
                      foregroundImage: NetworkImage(viewModel.data?.avatar ?? ''),
                    ),
                    verticalSpacing16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [const Text('ID:', style: fontFamilyRegular), Text(viewModel.data?.id?.toString() ?? 'N/A')],
                    ),
                    verticalSpacing16,
                    Text('Name: ${viewModel.data?.firstName} ${viewModel.data?.lastName} '),
                    verticalSpacing16,
                    Text('Dept: ${viewModel.data?.email}'),
                    verticalSpacing16,
                    const Text('year: 2023')
                  ])
                : emptySpacing),
      ),
    );
  }
}

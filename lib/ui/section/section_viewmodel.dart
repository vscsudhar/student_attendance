import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';

class SectionViewModel extends BaseViewModel with NavigationMixin {
  SectionViewModel();

  final _classList = [
    const DropDownValueModel(name: 'CSE', value: '1'),
    const DropDownValueModel(name: 'ECE', value: '2'),
    const DropDownValueModel(name: 'EEE', value: '3'),
    const DropDownValueModel(name: 'CIVIL', value: '4'),
  ];
  final _yearList = [
    const DropDownValueModel(name: 'First', value: '1'),
    const DropDownValueModel(name: 'Second', value: '2'),
    const DropDownValueModel(name: 'Third', value: '3'),
    const DropDownValueModel(name: 'Final', value: '4'),
  ];
  final _sectionlist = [
    const DropDownValueModel(name: 'Section A', value: 'A'),
    const DropDownValueModel(name: 'Section B', value: 'B'),
  ];
  final _subjectList = [
    const DropDownValueModel(name: 'Tamil', value: '1'),
    const DropDownValueModel(name: 'English', value: '2'),
    const DropDownValueModel(name: 'Maths', value: '3'),
  ];

  List<DropDownValueModel> get classList => _classList;
  List<DropDownValueModel> get yearList => _yearList;
  List<DropDownValueModel> get sectionlist => _sectionlist;
  List<DropDownValueModel> get subjectList => _subjectList;
}

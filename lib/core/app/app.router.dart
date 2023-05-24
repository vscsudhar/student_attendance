// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;
import 'package:workspace/core/models/students_model.dart' as _i11;
import 'package:workspace/ui/changepassword/changepass_view.dart' as _i7;
import 'package:workspace/ui/dashboard/dashboard_view.dart' as _i3;
import 'package:workspace/ui/login/login_view.dart' as _i2;
import 'package:workspace/ui/profiles/profile_view.dart' as _i6;
import 'package:workspace/ui/section/section_view.dart' as _i5;
import 'package:workspace/ui/student_confirmation/student_confirmation_view.dart'
    as _i9;
import 'package:workspace/ui/student_details/studentsdetails_view.dart' as _i8;
import 'package:workspace/ui/students/students_view.dart' as _i4;

class Routes {
  static const loginView = '/';

  static const dashboardView = '/dashboard-view';

  static const studentView = '/student-view';

  static const sectionView = '/section-view';

  static const profileView = '/profile-view';

  static const changepassView = '/changepass-view';

  static const studentDetailsView = '/student-details-view';

  static const studentConfirmationView = '/student-confirmation-view';

  static const all = <String>{
    loginView,
    dashboardView,
    studentView,
    sectionView,
    profileView,
    changepassView,
    studentDetailsView,
    studentConfirmationView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i3.DashboardView,
    ),
    _i1.RouteDef(
      Routes.studentView,
      page: _i4.StudentView,
    ),
    _i1.RouteDef(
      Routes.sectionView,
      page: _i5.SectionView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i6.ProfileView,
    ),
    _i1.RouteDef(
      Routes.changepassView,
      page: _i7.ChangepassView,
    ),
    _i1.RouteDef(
      Routes.studentDetailsView,
      page: _i8.StudentDetailsView,
    ),
    _i1.RouteDef(
      Routes.studentConfirmationView,
      page: _i9.StudentConfirmationView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.DashboardView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.DashboardView(),
        settings: data,
      );
    },
    _i4.StudentView: (data) {
      final args = data.getArgs<StudentViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.StudentView(data: args.data, key: args.key),
        settings: data,
      );
    },
    _i5.SectionView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SectionView(),
        settings: data,
      );
    },
    _i6.ProfileView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ProfileView(),
        settings: data,
      );
    },
    _i7.ChangepassView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ChangepassView(),
        settings: data,
      );
    },
    _i8.StudentDetailsView: (data) {
      final args = data.getArgs<StudentDetailsViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.StudentDetailsView(Id: args.Id, key: args.key),
        settings: data,
      );
    },
    _i9.StudentConfirmationView: (data) {
      final args =
          data.getArgs<StudentConfirmationViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.StudentConfirmationView(
            absentStudentList: args.absentStudentList,
            presentStudentList: args.presentStudentList,
            key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class StudentViewArguments {
  const StudentViewArguments({
    required this.data,
    this.key,
  });

  final List<_i11.Data>? data;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"data": "$data", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentViewArguments other) {
    if (identical(this, other)) return true;
    return other.data == data && other.key == key;
  }

  @override
  int get hashCode {
    return data.hashCode ^ key.hashCode;
  }
}

class StudentDetailsViewArguments {
  const StudentDetailsViewArguments({
    required this.Id,
    this.key,
  });

  final int Id;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"Id": "$Id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.Id == Id && other.key == key;
  }

  @override
  int get hashCode {
    return Id.hashCode ^ key.hashCode;
  }
}

class StudentConfirmationViewArguments {
  const StudentConfirmationViewArguments({
    required this.absentStudentList,
    required this.presentStudentList,
    this.key,
  });

  final List<_i11.Data> absentStudentList;

  final List<_i11.Data> presentStudentList;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"absentStudentList": "$absentStudentList", "presentStudentList": "$presentStudentList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentConfirmationViewArguments other) {
    if (identical(this, other)) return true;
    return other.absentStudentList == absentStudentList &&
        other.presentStudentList == presentStudentList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return absentStudentList.hashCode ^
        presentStudentList.hashCode ^
        key.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentView({
    required List<_i11.Data>? data,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentView,
        arguments: StudentViewArguments(data: data, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSectionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sectionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangepassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changepassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentDetailsView({
    required int Id,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentDetailsView,
        arguments: StudentDetailsViewArguments(Id: Id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentConfirmationView({
    required List<_i11.Data> absentStudentList,
    required List<_i11.Data> presentStudentList,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentConfirmationView,
        arguments: StudentConfirmationViewArguments(
            absentStudentList: absentStudentList,
            presentStudentList: presentStudentList,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentView({
    required List<_i11.Data>? data,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentView,
        arguments: StudentViewArguments(data: data, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSectionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sectionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangepassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changepassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentDetailsView({
    required int Id,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentDetailsView,
        arguments: StudentDetailsViewArguments(Id: Id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentConfirmationView({
    required List<_i11.Data> absentStudentList,
    required List<_i11.Data> presentStudentList,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentConfirmationView,
        arguments: StudentConfirmationViewArguments(
            absentStudentList: absentStudentList,
            presentStudentList: presentStudentList,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

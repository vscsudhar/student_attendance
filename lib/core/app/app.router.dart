// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i14;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;
import 'package:workspace/core/models/login_model.dart' as _i15;
import 'package:workspace/core/models/students_model.dart' as _i16;
import 'package:workspace/ui/announcement_details/announcement_details_view.dart'
    as _i11;
import 'package:workspace/ui/attendance_view/attendance_view.dart' as _i12;
import 'package:workspace/ui/changepassword/changepass_view.dart' as _i8;
import 'package:workspace/ui/dashboard/dashboard_view.dart' as _i4;
import 'package:workspace/ui/login/login_view.dart' as _i3;
import 'package:workspace/ui/profiles/profile_view.dart' as _i7;
import 'package:workspace/ui/section/section_view.dart' as _i6;
import 'package:workspace/ui/splash/splash_view.dart' as _i2;
import 'package:workspace/ui/student_confirmation/student_confirmation_view.dart'
    as _i10;
import 'package:workspace/ui/student_details/studentsdetails_view.dart' as _i9;
import 'package:workspace/ui/students/students_view.dart' as _i5;
import 'package:workspace/ui/view_section/view_section_view.dart' as _i13;

class Routes {
  static const splashView = '/';

  static const loginView = '/login-view';

  static const dashboardView = '/dashboard-view';

  static const studentView = '/student-view';

  static const sectionView = '/section-view';

  static const profileView = '/profile-view';

  static const changepassView = '/changepass-view';

  static const studentDetailsView = '/student-details-view';

  static const studentConfirmationView = '/student-confirmation-view';

  static const announcementDetailsView = '/announcement-details-view';

  static const attandanceView = '/attandance-view';

  static const viewSection = '/view-section';

  static const all = <String>{
    splashView,
    loginView,
    dashboardView,
    studentView,
    sectionView,
    profileView,
    changepassView,
    studentDetailsView,
    studentConfirmationView,
    announcementDetailsView,
    attandanceView,
    viewSection,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i4.DashboardView,
    ),
    _i1.RouteDef(
      Routes.studentView,
      page: _i5.StudentView,
    ),
    _i1.RouteDef(
      Routes.sectionView,
      page: _i6.SectionView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i7.ProfileView,
    ),
    _i1.RouteDef(
      Routes.changepassView,
      page: _i8.ChangepassView,
    ),
    _i1.RouteDef(
      Routes.studentDetailsView,
      page: _i9.StudentDetailsView,
    ),
    _i1.RouteDef(
      Routes.studentConfirmationView,
      page: _i10.StudentConfirmationView,
    ),
    _i1.RouteDef(
      Routes.announcementDetailsView,
      page: _i11.AnnouncementDetailsView,
    ),
    _i1.RouteDef(
      Routes.attandanceView,
      page: _i12.AttandanceView,
    ),
    _i1.RouteDef(
      Routes.viewSection,
      page: _i13.ViewSection,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.DashboardView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DashboardView(),
        settings: data,
      );
    },
    _i5.StudentView: (data) {
      final args = data.getArgs<StudentViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.StudentView(
            cId: args.cId,
            hId: args.hId,
            subjectId: args.subjectId,
            key: args.key),
        settings: data,
      );
    },
    _i6.SectionView: (data) {
      final args = data.getArgs<SectionViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.SectionView(loginResponse: args.loginResponse, key: args.key),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.ChangepassView: (data) {
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ChangepassView(),
        settings: data,
      );
    },
    _i9.StudentDetailsView: (data) {
      final args = data.getArgs<StudentDetailsViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.StudentDetailsView(student: args.student, key: args.key),
        settings: data,
      );
    },
    _i10.StudentConfirmationView: (data) {
      final args =
          data.getArgs<StudentConfirmationViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.StudentConfirmationView(
            cid: args.cid,
            hid: args.hid,
            subjectId: args.subjectId,
            absentStudentList: args.absentStudentList,
            presentStudentList: args.presentStudentList,
            key: args.key),
        settings: data,
      );
    },
    _i11.AnnouncementDetailsView: (data) {
      final args =
          data.getArgs<AnnouncementDetailsViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.AnnouncementDetailsView(
            annoncement: args.annoncement, key: args.key),
        settings: data,
      );
    },
    _i12.AttandanceView: (data) {
      final args = data.getArgs<AttandanceViewArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.AttandanceView(
            cid: args.cid, hid: args.hid, sdate: args.sdate, key: args.key),
        settings: data,
      );
    },
    _i13.ViewSection: (data) {
      final args = data.getArgs<ViewSectionArguments>(nullOk: false);
      return _i14.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.ViewSection(loginResponse: args.loginResponse, key: args.key),
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
    required this.cId,
    required this.hId,
    required this.subjectId,
    this.key,
  });

  final String cId;

  final String hId;

  final String subjectId;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"cId": "$cId", "hId": "$hId", "subjectId": "$subjectId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentViewArguments other) {
    if (identical(this, other)) return true;
    return other.cId == cId &&
        other.hId == hId &&
        other.subjectId == subjectId &&
        other.key == key;
  }

  @override
  int get hashCode {
    return cId.hashCode ^ hId.hashCode ^ subjectId.hashCode ^ key.hashCode;
  }
}

class SectionViewArguments {
  const SectionViewArguments({
    required this.loginResponse,
    this.key,
  });

  final _i15.LoginResponse? loginResponse;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"loginResponse": "$loginResponse", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SectionViewArguments other) {
    if (identical(this, other)) return true;
    return other.loginResponse == loginResponse && other.key == key;
  }

  @override
  int get hashCode {
    return loginResponse.hashCode ^ key.hashCode;
  }
}

class StudentDetailsViewArguments {
  const StudentDetailsViewArguments({
    required this.student,
    this.key,
  });

  final _i16.GetStudentResponse student;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"student": "$student", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.student == student && other.key == key;
  }

  @override
  int get hashCode {
    return student.hashCode ^ key.hashCode;
  }
}

class StudentConfirmationViewArguments {
  const StudentConfirmationViewArguments({
    required this.cid,
    required this.hid,
    required this.subjectId,
    required this.absentStudentList,
    required this.presentStudentList,
    this.key,
  });

  final int cid;

  final int hid;

  final int subjectId;

  final List<_i16.GetStudentResponse> absentStudentList;

  final List<_i16.GetStudentResponse> presentStudentList;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"cid": "$cid", "hid": "$hid", "subjectId": "$subjectId", "absentStudentList": "$absentStudentList", "presentStudentList": "$presentStudentList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant StudentConfirmationViewArguments other) {
    if (identical(this, other)) return true;
    return other.cid == cid &&
        other.hid == hid &&
        other.subjectId == subjectId &&
        other.absentStudentList == absentStudentList &&
        other.presentStudentList == presentStudentList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return cid.hashCode ^
        hid.hashCode ^
        subjectId.hashCode ^
        absentStudentList.hashCode ^
        presentStudentList.hashCode ^
        key.hashCode;
  }
}

class AnnouncementDetailsViewArguments {
  const AnnouncementDetailsViewArguments({
    required this.annoncement,
    this.key,
  });

  final _i15.Annoncement annoncement;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"annoncement": "$annoncement", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AnnouncementDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.annoncement == annoncement && other.key == key;
  }

  @override
  int get hashCode {
    return annoncement.hashCode ^ key.hashCode;
  }
}

class AttandanceViewArguments {
  const AttandanceViewArguments({
    required this.cid,
    required this.hid,
    required this.sdate,
    this.key,
  });

  final int cid;

  final int hid;

  final DateTime sdate;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"cid": "$cid", "hid": "$hid", "sdate": "$sdate", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AttandanceViewArguments other) {
    if (identical(this, other)) return true;
    return other.cid == cid &&
        other.hid == hid &&
        other.sdate == sdate &&
        other.key == key;
  }

  @override
  int get hashCode {
    return cid.hashCode ^ hid.hashCode ^ sdate.hashCode ^ key.hashCode;
  }
}

class ViewSectionArguments {
  const ViewSectionArguments({
    required this.loginResponse,
    this.key,
  });

  final _i15.LoginResponse? loginResponse;

  final _i14.Key? key;

  @override
  String toString() {
    return '{"loginResponse": "$loginResponse", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ViewSectionArguments other) {
    if (identical(this, other)) return true;
    return other.loginResponse == loginResponse && other.key == key;
  }

  @override
  int get hashCode {
    return loginResponse.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

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
    required String cId,
    required String hId,
    required String subjectId,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentView,
        arguments: StudentViewArguments(
            cId: cId, hId: hId, subjectId: subjectId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSectionView({
    required _i15.LoginResponse? loginResponse,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sectionView,
        arguments: SectionViewArguments(loginResponse: loginResponse, key: key),
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
    required _i16.GetStudentResponse student,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentDetailsView,
        arguments: StudentDetailsViewArguments(student: student, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentConfirmationView({
    required int cid,
    required int hid,
    required int subjectId,
    required List<_i16.GetStudentResponse> absentStudentList,
    required List<_i16.GetStudentResponse> presentStudentList,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentConfirmationView,
        arguments: StudentConfirmationViewArguments(
            cid: cid,
            hid: hid,
            subjectId: subjectId,
            absentStudentList: absentStudentList,
            presentStudentList: presentStudentList,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAnnouncementDetailsView({
    required _i15.Annoncement annoncement,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.announcementDetailsView,
        arguments: AnnouncementDetailsViewArguments(
            annoncement: annoncement, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAttandanceView({
    required int cid,
    required int hid,
    required DateTime sdate,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.attandanceView,
        arguments:
            AttandanceViewArguments(cid: cid, hid: hid, sdate: sdate, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewSection({
    required _i15.LoginResponse? loginResponse,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewSection,
        arguments: ViewSectionArguments(loginResponse: loginResponse, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
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
    required String cId,
    required String hId,
    required String subjectId,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentView,
        arguments: StudentViewArguments(
            cId: cId, hId: hId, subjectId: subjectId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSectionView({
    required _i15.LoginResponse? loginResponse,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.sectionView,
        arguments: SectionViewArguments(loginResponse: loginResponse, key: key),
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
    required _i16.GetStudentResponse student,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentDetailsView,
        arguments: StudentDetailsViewArguments(student: student, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentConfirmationView({
    required int cid,
    required int hid,
    required int subjectId,
    required List<_i16.GetStudentResponse> absentStudentList,
    required List<_i16.GetStudentResponse> presentStudentList,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentConfirmationView,
        arguments: StudentConfirmationViewArguments(
            cid: cid,
            hid: hid,
            subjectId: subjectId,
            absentStudentList: absentStudentList,
            presentStudentList: presentStudentList,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAnnouncementDetailsView({
    required _i15.Annoncement annoncement,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.announcementDetailsView,
        arguments: AnnouncementDetailsViewArguments(
            annoncement: annoncement, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAttandanceView({
    required int cid,
    required int hid,
    required DateTime sdate,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.attandanceView,
        arguments:
            AttandanceViewArguments(cid: cid, hid: hid, sdate: sdate, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewSection({
    required _i15.LoginResponse? loginResponse,
    _i14.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewSection,
        arguments: ViewSectionArguments(loginResponse: loginResponse, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

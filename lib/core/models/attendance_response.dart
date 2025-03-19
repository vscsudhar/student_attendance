// To parse this JSON data, do
//
//     final attendanceViewResponse = attendanceViewResponseFromJson(jsonString);

import 'dart:convert';

List<AttendanceViewResponse> attendanceViewResponseFromJson(String str) =>
    List<AttendanceViewResponse>.from(
        json.decode(str).map((x) => AttendanceViewResponse.fromJson(x)));

String attendanceViewResponseToJson(List<AttendanceViewResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceViewResponse {
  String? rollno;
  String? name;
  int? cid;
  String? attend;

  AttendanceViewResponse({
    this.rollno,
    this.name,
    this.cid,
    this.attend,
  });

  factory AttendanceViewResponse.fromJson(Map<String, dynamic> json) =>
      AttendanceViewResponse(
        rollno: json["rollno"],
        name: json["name"],
        cid: json["cid"],
        attend: json["attend"],
      );

  Map<String, dynamic> toJson() => {
        "rollno": rollno,
        "name": name,
        "cid": cid,
        "attend": attend,
      };
}

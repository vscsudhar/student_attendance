// To parse this JSON data, do
//
//     final saveAttendanceRequest = saveAttendanceRequestFromJson(jsonString);

import 'dart:convert';

SaveAttendanceRequest saveAttendanceRequestFromJson(String str) => SaveAttendanceRequest.fromJson(json.decode(str));

String saveAttendanceRequestToJson(SaveAttendanceRequest data) => json.encode(data.toJson());

class SaveAttendanceRequest {
    List<StudentAttendance>? studentAttendances;
    List<ClassAttendance>? classAttendances;

    SaveAttendanceRequest({
        this.studentAttendances,
        this.classAttendances,
    });

    factory SaveAttendanceRequest.fromJson(Map<String, dynamic> json) => SaveAttendanceRequest(
        studentAttendances: json["studentAttendances"] == null ? [] : List<StudentAttendance>.from(json["studentAttendances"]!.map((x) => StudentAttendance.fromJson(x))),
        classAttendances: json["classAttendances"] == null ? [] : List<ClassAttendance>.from(json["classAttendances"]!.map((x) => ClassAttendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "studentAttendances": studentAttendances == null ? [] : List<dynamic>.from(studentAttendances!.map((x) => x.toJson())),
        "classAttendances": classAttendances == null ? [] : List<dynamic>.from(classAttendances!.map((x) => x.toJson())),
    };
}

class ClassAttendance {
    int? insId;
    DateTime? sdate;
    int? cid;
    int? hid;
    int? subId;
    int? empId;
    DateTime? modOn;
    String? remarks;

    ClassAttendance({
        this.insId,
        this.sdate,
        this.cid,
        this.hid,
        this.subId,
        this.empId,
        this.modOn,
        this.remarks,
    });

    factory ClassAttendance.fromJson(Map<String, dynamic> json) => ClassAttendance(
        insId: json["insID"],
        sdate: json["sdate"] == null ? null : DateTime.parse(json["sdate"]),
        cid: json["cid"],
        hid: json["hid"],
        subId: json["subID"],
        empId: json["empID"],
        modOn: json["modOn"] == null ? null : DateTime.parse(json["modOn"]),
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "insID": insId,
        "sdate": sdate?.toIso8601String(),
        "cid": cid,
        "hid": hid,
        "subID": subId,
        "empID": empId,
        "modOn": modOn?.toIso8601String(),
        "remarks": remarks,
    };
}

class StudentAttendance {
    int? insId;
    int? cid;
    DateTime? sdate;
    String? rollno;
    int? subId;
    int? hid;
    int? attend;
    int? status;
    DateTime? modOn;

    StudentAttendance({
        this.insId,
        this.cid,
        this.sdate,
        this.rollno,
        this.subId,
        this.hid,
        this.attend,
        this.status,
        this.modOn,
    });

    factory StudentAttendance.fromJson(Map<String, dynamic> json) => StudentAttendance(
        insId: json["insID"],
        cid: json["cid"],
        sdate: json["sdate"] == null ? null : DateTime.parse(json["sdate"]),
        rollno: json["rollno"],
        subId: json["subID"],
        hid: json["hid"],
        attend: json["attend"],
        status: json["status"],
        modOn: json["modOn"] == null ? null : DateTime.parse(json["modOn"]),
    );

    Map<String, dynamic> toJson() => {
        "insID": insId,
        "cid": cid,
        "sdate": sdate?.toIso8601String(),
        "rollno": rollno,
        "subID": subId,
        "hid": hid,
        "attend": attend,
        "status": status,
        "modOn": modOn?.toIso8601String(),
    };
}

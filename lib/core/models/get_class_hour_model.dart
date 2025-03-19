// To parse this JSON data, do
//
//     final sectionViewResponse = sectionViewResponseFromJson(jsonString);

import 'dart:convert';

GetClassHoursResponse sectionViewResponseFromJson(String str) =>
    GetClassHoursResponse.fromJson(json.decode(str));

String sectionViewResponseToJson(GetClassHoursResponse data) =>
    json.encode(data.toJson());

class GetClassHoursResponse {
  List<ClassElement>? classes;
  List<Hour>? hour;

  GetClassHoursResponse({
    this.classes,
    this.hour,
  });

  factory GetClassHoursResponse.fromJson(Map<String, dynamic> json) =>
      GetClassHoursResponse(
        classes: json["classes"] == null
            ? []
            : List<ClassElement>.from(
                json["classes"]!.map((x) => ClassElement.fromJson(x))),
        hour: json["hour"] == null
            ? []
            : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "classes": classes == null
            ? []
            : List<dynamic>.from(classes!.map((x) => x.toJson())),
        "hour": hour == null
            ? []
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class ClassElement {
  int? cid;
  String? classClass;
  String? year;
  String? section;
  int? insId;

  ClassElement({
    this.cid,
    this.classClass,
    this.year,
    this.section,
    this.insId,
  });

  factory ClassElement.fromJson(Map<String, dynamic> json) => ClassElement(
        cid: json["cid"],
        classClass: json["class"],
        year: json["year"],
        section: json["section"],
        insId: json["insID"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "class": classClass,
        "year": year,
        "section": section,
        "insID": insId,
      };
}

class Hour {
  int? hid;
  String? hours;
  int? insId;
  DateTime? createdOn;
  dynamic modOn;
  dynamic remarks;

  Hour({
    this.hid,
    this.hours,
    this.insId,
    this.createdOn,
    this.modOn,
    this.remarks,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        hid: json["hid"],
        hours: json["hours"],
        insId: json["insID"],
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        modOn: json["modOn"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "hid": hid,
        "hours": hours,
        "insID": insId,
        "createdOn": createdOn?.toIso8601String(),
        "modOn": modOn,
        "remarks": remarks,
      };
}

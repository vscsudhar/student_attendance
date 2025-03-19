// To parse this JSON data, do
//
//     final staffLoginRequest = staffLoginRequestFromJson(jsonString);

import 'dart:convert';

StaffLoginRequest staffLoginRequestFromJson(String str) =>
    StaffLoginRequest.fromJson(json.decode(str));

String staffLoginRequestToJson(StaffLoginRequest data) =>
    json.encode(data.toJson());

class StaffLoginRequest {
  DateTime? atime;
  String? lat;
  String? long;
  String? wifi;
  String? employeeId;
  String? description;

  StaffLoginRequest({
    this.atime,
    this.lat,
    this.long,
    this.wifi,
    this.employeeId,
    this.description,
  });

  factory StaffLoginRequest.fromJson(Map<String, dynamic> json) =>
      StaffLoginRequest(
        atime: json["atime"] == null ? null : DateTime.parse(json["atime"]),
        lat: json["lat"],
        long: json["long"],
        wifi: json["wifi"],
        employeeId: json["employeeID"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "atime": atime?.toIso8601String(),
        "lat": lat,
        "long": long,
        "wifi": wifi,
        "employeeID": employeeId,
        "description": description,
      };
}

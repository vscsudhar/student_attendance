// To parse this JSON data, do
//
//     final getStudentResponse = getStudentResponseFromJson(jsonString);

import 'dart:convert';

List<GetStudentResponse> getStudentResponseFromJson(String str) => List<GetStudentResponse>.from(json.decode(str).map((x) => GetStudentResponse.fromJson(x)));

String getStudentResponseToJson(List<GetStudentResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentResponse {
    String? rollNo;
    String? studentName;
    int? classId;

    GetStudentResponse({
        this.rollNo,
        this.studentName,
        this.classId,
    });

    factory GetStudentResponse.fromJson(Map<String, dynamic> json) => GetStudentResponse(
        rollNo: json["rollNo"],
        studentName: json["studentName"],
        classId: json["class_ID"],
    );

    Map<String, dynamic> toJson() => {
        "rollNo": rollNo,
        "studentName": studentName,
        "class_ID": classId,
    };
}

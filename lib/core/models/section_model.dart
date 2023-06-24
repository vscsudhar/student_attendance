// To parse this JSON data, do
//
//     final sectionResponse = sectionResponseFromJson(jsonString);

import 'dart:convert';

SectionResponse sectionResponseFromJson(String str) => SectionResponse.fromJson(json.decode(str));

String sectionResponseToJson(SectionResponse data) => json.encode(data.toJson());

class SectionResponse {
    List<Subject>? subjects;
    List<Student>? students;

    SectionResponse({
        this.subjects,
        this.students,
    });

    factory SectionResponse.fromJson(Map<String, dynamic> json) => SectionResponse(
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
        students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
    };
}

class Student {
    String? rollNo;
    String? studentName;
    int? classId;

    Student({
        this.rollNo,
        this.studentName,
        this.classId,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
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

class Subject {
    int? subId;
    String? subject;
    dynamic insId;
    dynamic remarks;

    Subject({
        this.subId,
        this.subject,
        this.insId,
        this.remarks,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subId: json["subID"],
        subject: json["subject"],
        insId: json["insID"],
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "subID": subId,
        "subject": subject,
        "insID": insId,
        "remarks": remarks,
    };
}

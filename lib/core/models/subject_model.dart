// To parse this JSON data, do
//
//     final getSubjectResponse = getSubjectResponseFromJson(jsonString);

import 'dart:convert';

List<GetSubjectResponse> getSubjectResponseFromJson(String str) => List<GetSubjectResponse>.from(json.decode(str).map((x) => GetSubjectResponse.fromJson(x)));

String getSubjectResponseToJson(List<GetSubjectResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSubjectResponse {
    int? subId;
    String? subject;
    dynamic insId;
    dynamic remarks;

    GetSubjectResponse({
        this.subId,
        this.subject,
        this.insId,
        this.remarks,
    });

    factory GetSubjectResponse.fromJson(Map<String, dynamic> json) => GetSubjectResponse(
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

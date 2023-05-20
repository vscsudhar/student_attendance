// To parse this JSON data, do
//
//     final studentsResponse = studentsResponseFromJson(jsonString);

import 'dart:convert';

StudentsResponse studentsResponseFromJson(String str) => StudentsResponse.fromJson(json.decode(str));

String studentsResponseToJson(StudentsResponse data) => json.encode(data.toJson());

class StudentsResponse {
    int? page;
    int? perPage;
    int? total;
    int? totalPages;
    List<Data>? data;
    Support? support;

    StudentsResponse({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.support,
    });

    factory StudentsResponse.fromJson(Map<String, dynamic> json) => StudentsResponse(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
        support: json["support"] == null ? null : Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
    };
}

class Data {
    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? avatar;

    Data({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    String? url;
    String? text;

    Support({
        this.url,
        this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}

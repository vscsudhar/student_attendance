

// To parse this JSON data, do
//
//     final studentsDetailsResponse = studentsDetailsResponseFromJson(jsonString);

import 'dart:convert';

StudentsDetailsResponse studentsDetailsResponseFromJson(String str) => StudentsDetailsResponse.fromJson(json.decode(str));

String studentsDetailsResponseToJson(StudentsDetailsResponse data) => json.encode(data.toJson());

class StudentsDetailsResponse {
    Data? data;
    Support? support;

    StudentsDetailsResponse({
        this.data,
        this.support,
    });

    factory StudentsDetailsResponse.fromJson(Map<String, dynamic> json) => StudentsDetailsResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        support: json["support"] == null ? null : Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
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

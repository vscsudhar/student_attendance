// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String? logo;
    String? name;
    String? employeeId;
    String? insType;
    dynamic empattendstatus;
    String? token;
    List<Annoncement>? annoncement;

    LoginResponse({
        this.logo,
        this.name,
        this.employeeId,
        this.insType,
        this.empattendstatus,
        this.token,
        this.annoncement,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        logo: json["logo"],
        name: json["name"],
        employeeId: json["employeeID"],
        insType: json["insType"],
        empattendstatus: json["empattendstatus"],
        token: json["token"],
        annoncement: json["annoncement"] == null ? [] : List<Annoncement>.from(json["annoncement"]!.map((x) => Annoncement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "logo": logo,
        "name": name,
        "employeeID": employeeId,
        "insType": insType,
        "empattendstatus": empattendstatus,
        "token": token,
        "annoncement": annoncement == null ? [] : List<dynamic>.from(annoncement!.map((x) => x.toJson())),
    };
}

class Annoncement {
    String? title;
    String? details;

    Annoncement({
        this.title,
        this.details,
    });

    factory Annoncement.fromJson(Map<String, dynamic> json) => Annoncement(
        title: json["title"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "details": details,
    };
}


LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    String? userId;
    String? password;

    LoginRequest({
        this.userId,
        this.password,
    });

    factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        userId: json["userID"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "password": password,
    };
}

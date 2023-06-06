// To parse this JSON data, do
//
//     final boundryResponse = boundryResponseFromJson(jsonString);

import 'dart:convert';

BoundryResponse boundryResponseFromJson(String str) => BoundryResponse.fromJson(json.decode(str));

String boundryResponseToJson(BoundryResponse data) => json.encode(data.toJson());

class BoundryResponse {
    int? bid;
    int? insId;
    String? boundry;
    dynamic remarks;

    BoundryResponse({
        this.bid,
        this.insId,
        this.boundry,
        this.remarks,
    });

    factory BoundryResponse.fromJson(Map<String, dynamic> json) => BoundryResponse(
        bid: json["bid"],
        insId: json["insID"],
        boundry: json["boundry"],
        remarks: json["remarks"],
    );

    Map<String, dynamic> toJson() => {
        "bid": bid,
        "insID": insId,
        "boundry": boundry,
        "remarks": remarks,
    };
}

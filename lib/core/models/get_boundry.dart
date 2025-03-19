// To parse this JSON data, do
//
//     final getBoundryResponse = getBoundryResponseFromJson(jsonString);

import 'dart:convert';

GetBoundryResponse getBoundryResponseFromJson(String str) =>
    GetBoundryResponse.fromJson(json.decode(str));

String getBoundryResponseToJson(GetBoundryResponse data) =>
    json.encode(data.toJson());

class GetBoundryResponse {
  int? bid;
  int? insId;
  String? boundry;
  dynamic remarks;

  GetBoundryResponse({
    this.bid,
    this.insId,
    this.boundry,
    this.remarks,
  });

  factory GetBoundryResponse.fromJson(Map<String, dynamic> json) =>
      GetBoundryResponse(
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

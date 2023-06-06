// To parse this JSON data, do
//
//     final DataResponse = DataResponseFromJson(jsonString);

import 'dart:convert';

DataResponse DataResponseFromJson(String str) => DataResponse.fromJson(json.decode(str));

String DataResponseToJson(DataResponse data) => json.encode(data.toJson());

class DataResponse {
    List<List<dynamic>> dataset;
    int timestamp;
    int count;

    DataResponse({
        required this.dataset,
        required this.timestamp,
        required this.count,
    });

    factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
        dataset: List<List<dynamic>>.from(json["dataset"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        timestamp: json["timestamp"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "dataset": List<dynamic>.from(dataset.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "timestamp": timestamp,
        "count": count,
    };
}

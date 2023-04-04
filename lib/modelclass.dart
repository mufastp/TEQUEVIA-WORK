// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<qustion> weatherFromJson(String str) => List<qustion>.from(json.decode(str).map((x) => qustion.fromJson(x)));

String weatherToJson(List<qustion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class qustion {
    qustion({
        required this.id,
        required this.categoryName,
        required this.categoryImage,
        required this.categoryType,
        required this.createdOn,
    });

    int id;
    String categoryName;
    String categoryImage;
    String categoryType;
    DateTime createdOn;

    factory qustion.fromJson(Map<String, dynamic> json) => qustion(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryType: categoryTypeValues.map[json["category_type"]].toString(),
        createdOn: DateTime.parse(json["created_on"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_type": categoryTypeValues.reverse[categoryType],
        "created_on": createdOn.toIso8601String(),
    };
}

enum CategoryType { PRODUCT }

final categoryTypeValues = EnumValues({
    "product": CategoryType.PRODUCT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}

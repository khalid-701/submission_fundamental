import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'menus_model.dart';

part 'restaurant_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Restaurant {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'pictureId')
  String pictureId;

  @JsonKey(name: 'rating')
  int rating;

  @JsonKey(name: 'menus')
  Menus?  menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.pictureId,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

// class Restaurant{
//   String? id;
//   String? name;
//   String? description;
//   String? city;
//   String? pictureId;
//   int? rating;
//   List<Menus>? menus;
//
//   Restaurant(
//       {required this.id,
//      required this.name,
//      required this.pictureId,
//      required this.description,
//      required this.city,
//      required this.rating,
//      required this.menus});
//
//   Restaurant.fromJson(Map<dynamic, dynamic> restaurant) {
//     id = restaurant['id'];
//     name = restaurant['name'];
//     description = restaurant['description'];
//     pictureId = restaurant['pictureId'];
//     city = restaurant['city'];
//     rating = restaurant['rating'];
//     menus = restaurant['menus'] as List<Menus>;
//   }
//
// }
//
// List<Restaurant> parseRestaurant(String? json) {
//   if (json == "null") {
//     return [];
//   }
//
//   final List parsed = jsonDecode(json!);
//   return parsed.map((json) => Restaurant.fromJson(json)).toList();
// }

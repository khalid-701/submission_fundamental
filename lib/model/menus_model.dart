import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'drinks.dart';
import 'foods_model.dart';

part 'menus_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Menus {
  @JsonKey(name: 'foods')
  List<Foods>? foods;

  @JsonKey(name: 'drinks')
  List<Drinks>? drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}

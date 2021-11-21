
import 'package:json_annotation/json_annotation.dart';

part 'drinks.g.dart';

@JsonSerializable()
class Drinks {
  String? name;

  Drinks({required this.name});

  factory Drinks.fromJson(Map<String, dynamic> json) => _$DrinksFromJson(json);
  Map<String, dynamic> toJson() => _$DrinksToJson(this);
}
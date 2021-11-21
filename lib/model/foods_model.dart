
import 'package:json_annotation/json_annotation.dart';
part 'foods_model.g.dart';
@JsonSerializable()
class Foods{
  String? name;
  Foods({required this.name});


  factory Foods.fromJson(Map<String, dynamic> json) => _$FoodsFromJson(json);
  Map<String, dynamic> toJson() => _$FoodsToJson(this);


}


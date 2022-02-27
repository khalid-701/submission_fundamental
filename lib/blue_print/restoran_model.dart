import 'dart:convert';

class Resto{
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  MenuFd? menus;
  Resto(
      { required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating,
        required this.menus});
  Resto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'].toDouble();
    menus = (json['menus'] != null ? MenuFd.fromJson(json['menus']) : null)!;
  }
}

class MenuFd {
  List<Foods>? foods;
  List<Drinks>? drinks;
  MenuFd({required this.foods, required this.drinks});
  MenuFd.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = List<Foods>.empty(growable: true);
      json['foods'].forEach((resto) {
        foods!.add( Foods.fromJson(resto));
      });
    }
    if (json['drinks'] != null) {
      drinks =  List<Drinks>.empty(growable: true);
      json['drinks'].forEach((resto) {
        drinks!.add(Drinks.fromJson(resto));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (foods != null) {
      data['foods'] = foods!.map((resto) => resto.toJson()).toList();
    }
    if (this.drinks != null) {
      data['drinks'] = drinks!.map((resto) => resto.toJson()).toList();
    }
    return data;
  }
}

class Foods {

   String? name;

  Foods({required this.name});

  Foods.fromJson(Map<String, dynamic> json) {

    name = json['name'];

  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name'] = name;

    return data;

  }

}

class Drinks {

  String? name;

  Drinks({required this.name});

  Drinks.fromJson(Map<String, dynamic> json) {

    name = json['name'];

  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name'] = name;

    return data;

  }

}

List<Resto> parseData(String? json) {

  if (json == null) {

    return [];

  }

  final List parsed = jsonDecode(json)["restaurants"];

  return parsed.map((json) => Resto.fromJson(json)).toList();

}

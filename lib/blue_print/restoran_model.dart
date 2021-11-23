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

// class RestaurantModel {
//
//    List<Restaurant>?
//    restaurant;
//
//   RestaurantModel({required this.restaurant});
//
//   RestaurantModel.fromJson(Map<String, dynamic> json) {
//
//     if (json['restaurants'] != null) {
//
//       restaurant =  List<Restaurant>.empty(growable: true);
//
//       json['restaurants'].forEach((resto) {
//
//         restaurant!.add( Restaurant.fromJson(resto));
//
//       });
//
//     }
//
//   }
//
//   Map<String, dynamic> toJson() {
//
//     final Map<String, dynamic> data = Map<String, dynamic>();
//
//     if (restaurant != null) {
//
//       data['restaurants'] =
//
//           restaurant!.map((resto) => resto.toJson()).toList();
//
//     }
//
//     return data;
//
//   }
//
// }
//
// class Restaurant {
//
//   String? id;
//
//   String? name;
//
//   String? description;
//
//   String? pictureId;
//
//   String? city;
//
//   double? rating;
//
//   Menus? menus;
//
//   Restaurant(
//
//       { required this.id,
//
//       required this.name,
//
//       required this.description,
//
//       required this.pictureId,
//
//       required this.city,
//
//       required this.rating,
//
//       required this.menus});
//
//   Restaurant.fromJson(Map<String, dynamic> json) {
//
//     id = json['id'];
//
//     name = json['name'];
//
//     description = json['description'];
//
//     pictureId = json['pictureId'];
//
//     city = json['city'];
//
//     rating = json['rating'];
//
//     menus = (json['menus'] != null ? new Menus.fromJson(json['menus']) : null)!;
//
//   }
//
//   Map<String, dynamic> toJson() {
//
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     data['id'] = id;
//
//     data['name'] = name;
//
//     data['description'] = description;
//
//     data['pictureId'] = pictureId;
//
//     data['city'] = city;
//
//     data['rating'] = rating;
//
//     if (menus != null) {
//
//       data['menus'] = menus!.toJson();
//
//     }
//
//     return data;
//
//   }
//
// }
//
// class Menus {
//
//   List<Foods>? foods;
//
//   List<Drinks>? drinks;
//
//   Menus({required this.foods, required this.drinks});
//
//   Menus.fromJson(Map<String, dynamic> json) {
//
//     if (json['foods'] != null) {
//
//       foods = List<Foods>.empty(growable: true);
//
//       json['foods'].forEach((resto) {
//
//         foods!.add( Foods.fromJson(resto));
//
//       });
//
//     }
//
//     if (json['drinks'] != null) {
//
//       drinks =  List<Drinks>.empty(growable: true);
//
//       json['drinks'].forEach((resto) {
//
//         drinks!.add(Drinks.fromJson(resto));
//
//       });
//
//     }
//
//   }
//
//   Map<String, dynamic> toJson() {
//
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     if (foods != null) {
//
//       data['foods'] = foods!.map((resto) => resto.toJson()).toList();
//
//     }
//
//     if (this.drinks != null) {
//
//       data['drinks'] = drinks!.map((resto) => resto.toJson()).toList();
//
//     }
//
//     return data;
//
//   }
//
// }
//
// class Foods {
//
//    String? name;
//
//   Foods({required this.name});
//
//   Foods.fromJson(Map<String, dynamic> json) {
//
//     name = json['name'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//
//     final Map<String, dynamic> data = Map<String, dynamic>();
//
//     data['name'] = name;
//
//     return data;
//
//   }
//
// }
//
// class Drinks {
//
//   String? name;
//
//   Drinks({required this.name});
//
//   Drinks.fromJson(Map<String, dynamic> json) {
//
//     name = json['name'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//
//     final Map<String, dynamic> data = Map<String, dynamic>();
//
//     data['name'] = name;
//
//     return data;
//
//   }
//
// }

// List<RestaurantModel> parseData(String? json) {
//
//   if (json == null) {
//
//     return [];
//
//   }
//
//   final List parsed = jsonDecode(json)["restaurants"];
//
//   return parsed.map((json) => RestaurantModel.fromJson(json)).toList();
//
// }
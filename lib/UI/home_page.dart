import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:submission_fundamental/blue_print/restoran_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),

      //ListView.builder(itemBuilder: (context, index))

      body: FutureBuilder<dynamic>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<RestaurantModel> resto = parseData(snapshot.data);

          print("ini data resto "+resto.toString());

          return ListView.builder(
            itemCount: resto.length,
            itemBuilder: (context, index) {
           //   return _buildItems(context, resto[index].restaurant![index]);
           //    print(resto[index].restaurant!.toString());
              return resto.isEmpty ? Container() : ListTile(
                title: Text(resto[index].restaurant![index].name![0]),
              ) ;
            },
          );
        },
      ),
    );
  }

  Widget _buildItems(BuildContext context, Restaurant data) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 44,
          maxHeight: 44,
        ),
        child: Image.network(data.pictureId.toString(), fit: BoxFit.cover),
      ),
      title: Text(data.name.toString()),
      subtitle: Text("${data.city.toString()}\n ${data.rating}"),
      isThreeLine: true,
    );
  }
}

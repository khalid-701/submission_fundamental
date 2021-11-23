import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:submission_fundamental/UI/resto_detail_page.dart';
import 'package:submission_fundamental/blue_print/restoran_model.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home';
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
          final List<Resto> resto = parseData(snapshot.data);
          return resto.length != 0 ? ListView.builder(
            itemCount: resto.length,
              itemBuilder: (context, index) {
            return _buildItems(context, resto[index]);
          }) :
              Center(child: Text("data tidak ada"),);

        },
      ),
    );
  }

  Widget _buildItems(BuildContext context, Resto data) {
    return ListTile(
      onTap: (){
        print("klik");
        Navigator.pushNamed(context, RestoDetail.routeName, arguments: data);
      },
      leading: Hero(
        tag: data.pictureId.toString(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 66,
            maxHeight: 66,
          ),
          child: Image.network(data.pictureId.toString(), fit: BoxFit.cover),
        ),
      ),
      title: Text(data.name.toString()),
      subtitle: Text("${data.city.toString()}\n ${data.rating}"),
      isThreeLine: true,
    );
  }
}

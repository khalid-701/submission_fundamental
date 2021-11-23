import 'package:flutter/material.dart';
import 'package:submission_fundamental/blue_print/restoran_model.dart';

class RestoDetail extends StatelessWidget {
  static const routeName = '/resto_detail';
  final Resto resto;
  const RestoDetail({Key? key,required this.resto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resto Detail"),
      ),
      body: Column(
        children: [
          Hero(
            tag: resto.pictureId.toString(),
              child: Image.network(resto.pictureId.toString(), width: MediaQuery.of(context).size.width, height: 300,)),
          Text(resto.name.toString()),

        ],
      ),
    );
  }
}

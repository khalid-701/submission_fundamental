import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Restaurant",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Recommendation for you!",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 25,),
              Expanded(
                child: FutureBuilder<dynamic>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/local_restaurant.json'),
                  builder: (context, snapshot) {
                    final List<Resto> resto = parseData(snapshot.data);
                    return resto.isNotEmpty
                        ? ListView.separated(
                            itemCount: resto.length,
                            itemBuilder: (context, index) {
                              return _buildItems(context, resto[index]);
                            }, separatorBuilder: (BuildContext context, int index) => Divider(),)
                        : Center(
                            child: Text("No data found", style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context, Resto data) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, RestoDetail.routeName, arguments: data);
      },
      leading: Hero(
        tag: data.pictureId.toString(),
        child: SizedBox(
          width: 100,
          height: 80,
          child: Image.network("${data.pictureId}", fit: BoxFit.cover),
        ),
      ),
      title: Text("${data.name}", style: GoogleFonts.lato(
        textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      )),
      subtitle: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(Icons.location_on_outlined, size: 14),
            ),
            TextSpan(
                text: "${data.city} \n\n", style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
              ),
            )),
            const WidgetSpan(
              child: Icon(Icons.star, size: 14),
            ),
            TextSpan(
                text: "${data.rating}", style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
      isThreeLine: true,
    );
  }
}

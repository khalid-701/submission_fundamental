import 'package:flutter/material.dart';
import 'package:submission_fundamental/UI/home_page.dart';
import 'package:submission_fundamental/UI/resto_detail_page.dart';

import 'UI/splash_screen.dart';
import 'blue_print/restoran_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black), // 1
        ),
      ),
      home: const SplashScreen(),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        RestoDetail.routeName: (context) => RestoDetail(
              resto: ModalRoute.of(context)!.settings.arguments as Resto,
            )
      },
    );
  }
}

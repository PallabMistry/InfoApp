import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/home.dart';
import 'package:infoapp/info_pages/info_hospital.dart';
import 'package:infoapp/info_pages/info_mountain.dart';
import 'package:infoapp/info_pages/info_palace.dart';
import 'package:infoapp/info_pages/info_river.dart';
import 'package:infoapp/info_pages/info_university.dart';
import 'package:infoapp/info_pages/info_waterfall.dart';
import 'package:infoapp/splashscreen.dart';
import 'info_pages/info_richman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () =>  MaterialApp(
        initialRoute: "/",
        routes: {
          info_university.route:(context)=>info_university(),
          info_hospital.route:(context)=>info_hospital(),
          info_mountain.route:(context)=>info_mountain(),
          info_river.route:(context)=>info_river(),
          splashscreen.route:(context)=>splashscreen(),
          info_palace.route:(context)=>info_palace(),
          info_waterfall.route:(context)=>info_waterfall(),
          info_richman.route:(context)=>info_richman(),


        },

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:splashscreen(),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/richman_item.dart';
import 'package:infoapp/info_widget/river_item.dart';

class info_richman extends StatefulWidget {
  const info_richman({Key? key}) : super(key: key);
  static const String route="/inforichman";

  @override
  _info_richmanState createState() => _info_richmanState();
}

class _info_richmanState extends State<info_richman> {
  PageController controller=PageController();
  double pageNumber=0.0;
  @override
  void initState(){
    controller=PageController(
      initialPage: 0,
      viewportFraction: 1,
    );
    controller.addListener(() {
      setState(() {
        pageNumber=controller.page!;
      });
    });

    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('img/richman.png',width: double.infinity,fit: BoxFit.fitHeight,height: 720.h,),
            PageView.builder(
              controller:controller ,
              itemBuilder: (context, index) => richman_item(richmans[index], pageNumber, index.toDouble()),
              itemCount: richmans.length,
            ),
          ],
        ),
      ),

    );
  }
}

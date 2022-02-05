import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/hospital_item.dart';
import 'package:infoapp/info_widget/palace_item.dart';

class info_palace extends StatefulWidget {
  const info_palace({Key? key}) : super(key: key);
  static const String route="/infopalace";
  @override
  _info_palaceState createState() => _info_palaceState();
}

class _info_palaceState extends State<info_palace> {
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
    // setState(() {
    //   controller.addListener(() {
    //     pageNumber=controller.page!;
    // });
    //
    //  });

    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset('img/graduation.png',width: double.infinity,fit: BoxFit.fitHeight,height: 720.h,),
              PageView.builder(
                controller:controller ,
                itemBuilder: (context, index) => palace_item(palaces[index], pageNumber, index.toDouble()),
                itemCount: palaces.length,
              ),
            ],
          ),


        ));
  }
}

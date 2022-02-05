import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/mountain_item.dart';

class info_mountain extends StatefulWidget {
  const info_mountain({Key? key}) : super(key: key);
  static const String route="/infomountain";
  @override
  _info_mountainState createState() => _info_mountainState();
}

class _info_mountainState extends State<info_mountain> {
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
              Image.asset('img/mountain.png',width: double.infinity,fit: BoxFit.fitHeight,height: 720.h,),
              PageView.builder(
                controller:controller ,
                itemBuilder: (context, index) => mountain_item(mountains[index], pageNumber, index.toDouble()),
                itemCount: mountains.length,
              ),
            ],
          ),


        ));
  }
}

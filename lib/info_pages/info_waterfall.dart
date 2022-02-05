import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/waterfall_item.dart';

class info_waterfall extends StatefulWidget {
  const info_waterfall({Key? key}) : super(key: key);
  static const String route="/infowaterfall";
  @override
  _info_waterfallState createState() => _info_waterfallState();
}

class _info_waterfallState extends State<info_waterfall> {
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
              Image.asset('img/graduation.png',width: double.infinity,fit: BoxFit.fitHeight,height: 720.h,),
              PageView.builder(
                controller:controller ,
                itemBuilder: (context, index) => waterfall_item(waterfalls[index], pageNumber, index.toDouble()),
                itemCount: waterfalls.length,
              ),
            ],
          ),


        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/river_item.dart';

class info_river extends StatefulWidget {
  const info_river({Key? key}) : super(key: key);
  static const String route="/inforiver";

  @override
  _info_riverState createState() => _info_riverState();
}

class _info_riverState extends State<info_river> {
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
            Image.asset('img/river.png',width: double.infinity,fit: BoxFit.fitHeight,height: 720.h,),
            PageView.builder(
              controller:controller ,
              itemBuilder: (context, index) => river_item(rivers[index], pageNumber, index.toDouble()),
              itemCount: rivers.length,
            ),
          ],
        ),
      ),

    );
  }
}

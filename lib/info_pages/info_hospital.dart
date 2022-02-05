import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/hospital_item.dart';

class info_hospital extends StatefulWidget {
  const info_hospital({Key? key}) : super(key: key);
  static const String route="/infohospital";
  @override
  _info_hospitalState createState() => _info_hospitalState();
}

class _info_hospitalState extends State<info_hospital> {
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
                itemBuilder: (context, index) => hospital_item(hospitals[index], pageNumber, index.toDouble()),
                itemCount: hospitals.length,
              ),
            ],
          ),


        ));
  }
}

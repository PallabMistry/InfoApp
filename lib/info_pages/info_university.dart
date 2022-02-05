import 'package:flutter/material.dart';
import 'package:infoapp/info_db/db.dart';
import 'package:infoapp/info_widget/university_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class info_university extends StatefulWidget {
  const info_university({Key? key}) : super(key: key);
static const String route="/infouniversity";
  @override
  _info_universityState createState() => _info_universityState();
}

class _info_universityState extends State<info_university> {
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
                itemBuilder: (context, index) => university_item(universitys[index], pageNumber, index.toDouble()),
                itemCount: universitys.length,
              ),
            ],
          ),


        ));
  }
}

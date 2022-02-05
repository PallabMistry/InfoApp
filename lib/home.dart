import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Info App',style:GoogleFonts.bangers(fontWeight: FontWeight.bold,fontSize: 30.sp,color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors:[
                  Color(0xFFFF800B),
                  Color(0xFFccb3ff),
                  Color(0xFFccff99),
                ] )
        ),
        child: Padding(padding: EdgeInsets.all(20.w),

          child: Expanded(


            child: GridView.count(

              crossAxisSpacing:20.w,
              mainAxisSpacing: 20.w,
              crossAxisCount: 2,
              children: [

                ElevatedButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, "/infouniversity" );
                }, child: Column(
                  children: [
                    Center(child: Image.asset('img/graduation.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                    Text('University',style: GoogleFonts.openSans(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )),
               ElevatedButton(
                    style: SecondStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, "/infohospital" );
                      }, child: Column(
                        children: [
                          Center(child: Image.asset('img/clinic.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                          Text('Hospital',style: GoogleFonts.openSans(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                        ],
                      )),

                ElevatedButton(
                    style: thirdStyle,
                    onPressed: () {
                     Navigator.pushNamed(context, "/infomountain" );

                }, child: Column(
                  children: [
                    Center(child: Image.asset('img/mountain.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                    Text('Mountain',style: GoogleFonts.openSans(fontSize:12.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )),
                 ElevatedButton(
                   style: fourStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, "/inforiver" );

                }, child: Column(
                  children: [
                    Center(child: Image.asset('img/river.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                    Text('River',style: GoogleFonts.openSans(fontSize:12.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )),

                ElevatedButton(
                  style: fiveStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, "/infowaterfall" );

                }, child: Column(
                  children: [
                    Center(child: Image.asset('img/waterfall.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                    Text('WaterFall',style: GoogleFonts.openSans(fontSize:12.sp,color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                )),
              ElevatedButton(
                style: sixStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, "/infopalace" );

                }, child: Column(
                  children: [
                    Center(child: Image.asset('img/mahal.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                    Text('Palace',style: GoogleFonts.openSans(fontSize:12.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )),ElevatedButton(
                style: sevenStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, "/inforichman" );

                }, child: Column(
                  children: [
                    Center(child: Image.asset('img/richman.png',height: 120.h, width:120.w,fit: BoxFit.cover,),),
                    Text('RichMan',style: GoogleFonts.openSans(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )),
              ],
            ),
          ),

        ),
      ),

    );
  }
}
final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
  primary: Color(0xffffff66),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),

);
final ButtonStyle SecondStyle=ElevatedButton.styleFrom(
  primary: Color(0xffdf80ff),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
);
final ButtonStyle thirdStyle=ElevatedButton.styleFrom(
  //primary: Color(0xffcc99ff),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
);final ButtonStyle fourStyle=ElevatedButton.styleFrom(
  primary: Color(0xff80ffbf),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w))
  ,
);final ButtonStyle fiveStyle=ElevatedButton.styleFrom(
  primary: Colors.black,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
);final ButtonStyle sixStyle=ElevatedButton.styleFrom(
  primary: Color(0xffd9e6f2),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
);final ButtonStyle sevenStyle=ElevatedButton.styleFrom(
  primary: Color(0xffff8000),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
);


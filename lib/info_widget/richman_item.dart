import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_model/info.dart';

class richman_item extends StatefulWidget {


  final Richman richmans;
  final double pageNmber;
  final double index;


  richman_item(this.richmans, this.pageNmber, this.index);

  @override
  _richman_itemState createState() => _richman_itemState();
}

class _richman_itemState extends State< richman_item> with SingleTickerProviderStateMixin {
  Animation<double> ?heightAnim;
  Animation<double> ?elevAnim;
  Animation<double> ?yoffsetAnim;
  Animation<double> ?scaleAnim;
  late AnimationController controller;

  bool isExpanded=false;

  @override
  void initState() {

    controller=AnimationController(duration:Duration(seconds: 1)  ,vsync: this);
    controller.addListener(() { });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {

    heightAnim=Tween(begin: 0.w,end:140.w ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.w,0.3.w,curve: Curves.bounceInOut)));
    super.didChangeDependencies();
    scaleAnim=Tween(begin: 0.95.w,end:1.w ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0.w,0.3.w,curve: Curves.bounceInOut)));
    super.didChangeDependencies();
    elevAnim=Tween(begin: 2.w,end:10.w ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0.w,0.3.w,curve: Curves.bounceInOut)));
    super.didChangeDependencies();
    yoffsetAnim=Tween(begin: 1.w,end:10.w ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0.w,0.3.w,curve: Curves.bounceInOut)));
    super.didChangeDependencies();
  }
  @override

  Widget build(BuildContext context) {
    double diff=widget.index-widget.pageNmber;
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3,2,0.002)
        ..rotateY(-pi/4*diff),
      alignment: diff>0?FractionalOffset.centerLeft:FractionalOffset.centerRight,


      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 220.h,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.richmans.name,style: GoogleFonts.permanentMarker(fontSize: 20.sp,color: Colors.white,),),
              background: Image.asset(widget.richmans.image,width: double.infinity,fit: BoxFit.cover,),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  color: Color(0xffb3d9ff),
                  child: Padding(padding:  EdgeInsets.only(left: 10.r,right: 10.r,bottom: 10.r,top: 100.r),
                    child: Text(widget.richmans.description,style: GoogleFonts.kalam(fontSize: 20.sp,color: Colors.black,),),

                  ),

                ),
                Transform.scale(
                  scale: scaleAnim!.value,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15.r,horizontal: 15.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xffff8080),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white30,
                              blurRadius: elevAnim!.value,
                              spreadRadius: 1.r,offset: Offset(0,yoffsetAnim!.value)
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(widget.richmans.name,style: GoogleFonts.bangers(fontSize: 20.sp,color: Colors.black),),
                          subtitle: Text(widget.richmans.category,style: GoogleFonts.lobsterTwo(fontSize: 22.sp,color: Colors.lightGreenAccent),),
                          trailing:Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('ranking :',style:GoogleFonts.cookie(fontSize: 20.sp),),
                              Text('${widget.richmans.ranking}',style: TextStyle(fontSize: 22.sp,color: Colors.white),),

                            ],) ,
                          onTap: () {
                            if(isExpanded){
                              controller.reverse();
                            }
                            else{
                              controller.forward();
                            }
                            setState(() {
                              isExpanded=!isExpanded;
                            });
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height:heightAnim!.value ,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width/1.5,
                              child: ListView(
                                children: [
                                  Text('Born: ${widget.richmans.Born}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Age: ${widget.richmans.age}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Education: ${widget.richmans.Education}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Occupation: ${widget.richmans.Occupation}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Spouse: ${widget.richmans.Spouse}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Partner: ${widget.richmans.Partner}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('NetWorth: ${widget.richmans.NetWorth}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Nationality: ${widget.richmans.Nationality}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Sourceofwealth: ${widget.richmans.Sourceofwealth}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
          ),
          ),
        ],
      ),
    );
  }
}

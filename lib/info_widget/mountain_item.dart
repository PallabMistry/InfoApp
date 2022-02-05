import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_model/info.dart';

class mountain_item extends StatefulWidget {


  final Mountain  mountains;
  final double pageNmber;
  final double index;


  mountain_item(this.mountains, this.pageNmber, this.index);

  @override
  _mountain_itemState createState() => _mountain_itemState();
}

class _mountain_itemState extends State< mountain_item> with SingleTickerProviderStateMixin {
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
              title: Text(widget.mountains.name,style: GoogleFonts.permanentMarker(fontSize: 20.sp,color: Colors.white,),),
              background: Image.asset(widget.mountains.image,width: double.infinity,fit: BoxFit.cover,),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  color: Color(0xffcc99ff),
                  child: Padding(padding:  EdgeInsets.only(left: 10.r,right: 10.r,bottom: 10.r,top: 100.r),
                    child: Text(widget.mountains.description,style: GoogleFonts.kalam(fontSize: 20.sp,color: Colors.black,),),

                  ),

                ),
                Transform.scale(
                  scale: scaleAnim!.value,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15.r,horizontal: 15.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xff66ff99),
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
                          title: Text(widget.mountains.name,style: GoogleFonts.bangers(fontSize: 20.sp,color: Colors.black),),
                          subtitle: Text(widget.mountains.category,style: GoogleFonts.lobsterTwo(fontSize: 22.sp,color: Colors.orange),),
                          trailing:Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('ranking :',style:GoogleFonts.cookie(fontSize: 20.sp),),
                              Text('${widget.mountains.ranking}',style: TextStyle(fontSize: 22.sp,color: Colors.white),),

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
                                  Text('World_Rank: ${widget.mountains.Elevation}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Faculty: ${widget.mountains.Prominence}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Department: ${widget.mountains.Isolation}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Staff: ${widget.mountains.Mountain_range}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
                                  Text('Location: ${widget.mountains.Location}',style: GoogleFonts.roboto(fontSize: 20.sp,fontWeight: FontWeight.bold)),
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

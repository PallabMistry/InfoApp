import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoapp/info_model/info.dart';

class river_item extends StatefulWidget {


  final River rivers;
  final double pageNmber;
  final double index;


  river_item(this.rivers, this.pageNmber, this.index);

  @override
  _river_itemState createState() => _river_itemState();
}

class _river_itemState extends State<river_item> with SingleTickerProviderStateMixin {
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
              title: Text(widget.rivers.name,style: GoogleFonts.permanentMarker(fontSize: 20.sp,color: Colors.white,),),
              background: Image.asset(widget.rivers.image,width: double.infinity,fit: BoxFit.cover,),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  color: Colors.deepOrangeAccent,
                  child: Padding(padding:  EdgeInsets.only(left: 10.r,right: 10.r,bottom: 10.r,top: 100.r),
                    child: Text(widget.rivers.description,style: GoogleFonts.kalam(fontSize: 25.sp,color: Colors.black,),),

                  ),

                ),
                Transform.scale(
                  scale: scaleAnim!.value,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15.r,horizontal: 15.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xffffff99),
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
                          title: Text(widget.rivers.name,style: GoogleFonts.bangers(fontSize: 20.sp,color: Colors.black),),
                          subtitle: Text(widget.rivers.category,style: GoogleFonts.lobsterTwo(fontSize: 22.sp,color: Colors.orange),),
                          trailing:Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star,color: Colors.black,),
                              Text('${widget.rivers.rating}',style: TextStyle(fontSize: 22.sp,color: Colors.black),),

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
                                  Text('Length: ${widget.rivers.length}',style: GoogleFonts.roboto(fontSize: 20.sp,),),
                                  Text('Source: ${widget.rivers.source}',style: GoogleFonts.roboto(fontSize: 20.sp,)),
                                  Text('Mouth: ${widget.rivers.mouth}',style: GoogleFonts.roboto(fontSize: 20.sp,)),
                                  Text('Bridge: ${widget.rivers.bridges}',style: GoogleFonts.roboto(fontSize:20.sp,)),
                                  Text('Cities: ${widget.rivers.cities}',style: GoogleFonts.roboto(fontSize: 20.sp,)),
                                  Text('Countries: ${widget.rivers.countries}',style: GoogleFonts.roboto(fontSize:20.sp,)),
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


import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);
    print('Device width:${ScreenUtil.screenWidth}'); //Device width
    print('Device height:${ScreenUtil.screenHeight}'); //Device height
    print(
        'Device pixel density:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        'Bottom safe zone distance:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        'Status bar height:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px
    print(
        'Ratio of actual width dp to design draft px:${ScreenUtil.getInstance().scaleWidth}');
    print(
        'Ratio of actual height dp to design draft px:${ScreenUtil.getInstance().scaleHeight}');
    print(
        'The ratio of font and width to the size of the design:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print(
        'The ratio of  height width to the size of the design:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');

    return Column(
      children: <Widget>[
        InfoTop(),
        Hours(),
      ],
    );
  }

  Widget InfoTop() {
    var contentTextStyle = new TextStyle(fontSize: 18.0, );
    return Container(
      height: ScreenUtil.getInstance().setHeight(933),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(680),
                height: ScreenUtil.getInstance().setHeight(333),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                  ),
                  child: Text(
                    "Information",
                    style:
                        TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(445),
                height: ScreenUtil.getInstance().setHeight(333),
                alignment: Alignment.bottomRight,
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/nav.png",
                    height: ScreenUtil.getInstance().setHeight(176 * 1.2),
                    width: ScreenUtil.getInstance().setWidth(247 * 1.2),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(1120),
                height: ScreenUtil.getInstance().setHeight(600),
                padding: EdgeInsets.only(
                  left: 24.0,
                  top: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Canadian dining at its finest.", style: contentTextStyle, ),
                    Text("Come explore a new,", style: contentTextStyle, ),
                    Text("completely renovated", style: contentTextStyle,),
                    Text("dining room with food", style: contentTextStyle,),
                    Text("and drinks.", style: contentTextStyle,),
                  ],
                ),
              ),
              // Container(
              //   width: ScreenUtil.getInstance().setWidth(445),
              //   height: ScreenUtil.getInstance().setHeight(600),
              //   color: Colors.orange,
              //   child: Align(
              //     alignment: Alignment(1,2),
              //     child: Image.asset("assets/images/plate_info.png"),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Hours() {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(119)),
      width: ScreenUtil.getInstance().setWidth(983),
      height: ScreenUtil.getInstance().setHeight(1211),
      // alignment: Alignment.center,
      // color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/images/icon_hours.png", width:54, height: 55,),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Hours", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500,),),
          ),
          SizedBox(height: 8.0,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/images/icon_remove_18dp.png",color: Colors.green,),
              Text("  DURING SITTING WEEKS", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Breakfast", textAlign: TextAlign.start), ),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("7am to 9am", textAlign: TextAlign.start), ),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Tue to Thu", textAlign: TextAlign.right), ),
            ],
          ),
          Divider(color: Colors.cyan, height: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Lunch", textAlign: TextAlign.start), ),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("11am to 1:30pm", textAlign: TextAlign.start),),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Mon to Fri", textAlign: TextAlign.right),),
            ],
          ),
          Divider(color: Colors.cyan, height: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Bar menu", textAlign: TextAlign.start,),),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("3pm to 5pm", textAlign: TextAlign.start),),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Mon to Thu", textAlign: TextAlign.right),),
            ],
          ),
          Divider(color: Colors.cyan, height: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Dinner", textAlign: TextAlign.start),),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("5pm to 8pm", textAlign: TextAlign.start),),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Mon to Thu", textAlign: TextAlign.right),),
            ],
          ),
          Divider(color: Colors.cyan, height: 1,),
          SizedBox(height: 40.0,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/images/icon_remove_18dp.png",color: Colors.green,),
              Text("  DURING RECESS WEEKS", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600,),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("Lunch", textAlign: TextAlign.start), ),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text("11am to 1:30pm", textAlign: TextAlign.start),),
              
              SizedBox(width: ScreenUtil.getInstance().setWidth(320), child: Text(" ", textAlign: TextAlign.right),),
            ],
          ),
          Divider(color: Colors.cyan, height: 1,),
        ],
      ),
    );
  }
}

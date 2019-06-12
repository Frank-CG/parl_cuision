import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parl_cuision/reservation/reserv_steps.dart';

class ReservationPage extends StatelessWidget {
  String _pageCommonFontFamily = "Nunito Sans";

  Function() callback;
  ReservationPage(this.callback);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Container(
      width: ScreenUtil.getInstance().setWidth(1125),
      height: ScreenUtil.getInstance().setHeight(2400),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(350),
            width: ScreenUtil.getInstance().setWidth(1125),
            color: Colors.white,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 16.0,),
            child: Text("Reservations", style: TextStyle(fontSize: 30.0, fontFamily: _pageCommonFontFamily, fontWeight: FontWeight.w700),)
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(1870),
            // color: Colors.grey[300],
            child: ReservSteps(callback),
          ),
        ],
      ),
    );
  }
}

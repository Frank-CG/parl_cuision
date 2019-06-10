import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodOper extends StatefulWidget {
  FoodOper({
    Key key,
    this.index,
    this.count,
  }) : super(key: key);

  int index;
  int count;

  @override
  _FoodOperState createState() => _FoodOperState();
}

class _FoodOperState extends State<FoodOper> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.add,
            color: Colors.green,
          ),
          Divider(
            color: Colors.grey,
            height: .6,
          ),
          Text(
            "0",
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
          Divider(
            color: Colors.grey,
            height: .6,
          ),
          Icon(
            Icons.remove,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

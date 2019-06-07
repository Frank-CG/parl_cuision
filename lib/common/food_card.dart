import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCard extends StatelessWidget {
  // const FoodCard({Key key}) : super(key: key);
  FoodCard({
    Key key,
    double width,
    double height,
    this.foodImg,
    this.name,
    this.price,
    this.count,
  }) : super(key: key);

  Image foodImg;
  String name;
  String price;
  int count;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(63), 0,
          ScreenUtil.getInstance().setWidth(63), 0),
      width: ScreenUtil.getInstance().setWidth(1500),
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(282),
              child: foodImg,
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(550),
              color: Colors.white,
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(name),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: ButtonTheme(
                          minWidth: ScreenUtil.getInstance().setWidth(30),
                          height: 30,
                          child: RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text("-"),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Container(
                        child: Text("0"),
                      ),
                      Container(
                        child: ButtonTheme(
                          minWidth: ScreenUtil.getInstance().setWidth(30),
                          height: 30,
                          child: RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text("+"),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(130),
              color: Colors.yellow,
              child: Text(price),
            ),
          ],
        ),
      ),
    );
  }
}
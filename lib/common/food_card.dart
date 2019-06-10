import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCard extends StatefulWidget {
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
  double price;
  int count;

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
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
              child: widget.foodImg,
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
                    padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(60),),
                    child: Text(widget.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(30),),
                    child: Row(
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
                              onPressed: () { setState(() {
                               if(widget.count > 0){ widget.count--; } 
                              }); },
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: ScreenUtil.getInstance().setWidth(20),
                          right: ScreenUtil.getInstance().setWidth(20),),
                          child: Text(widget.count.toString()),
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
                              onPressed: () { setState(() {
                               widget.count++;
                              }); },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(130),
              // color: Colors.yellow,
              child: Text("\$"+(widget.price*widget.count).toString()),
            ),
          ],
        ),
      ),
    );
  }
}

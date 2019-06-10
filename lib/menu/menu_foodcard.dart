import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuFoodCard extends StatefulWidget {
  MenuFoodCard({
    Key key,
    double width,
    double height,
    this.foodImg,
    this.name,
    this.price,
    this.count,
    this.index,
  }) : super(key: key);

  Image foodImg;
  String name;
  double price;
  int count;
  int index;

  @override
  _MenuFoodCardState createState() => _MenuFoodCardState();
}

class _MenuFoodCardState extends State<MenuFoodCard> {
  int foodCount = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    List<Image> test_FoodTypes = <Image>[
      Image.asset(
        "assets/images/icon_healthy.png",
        width: ScreenUtil.getInstance().setWidth(80),
      ),
      Image.asset(
        "assets/images/icon_vegetarian.png",
        width: ScreenUtil.getInstance().setWidth(80),
      ),
      Image.asset(
        "assets/images/icon_vegan.png",
        width: ScreenUtil.getInstance().setWidth(80),
      ),
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(63), 0,
          ScreenUtil.getInstance().setWidth(63), 0),
      width: ScreenUtil.getInstance().setWidth(999),
      height: ScreenUtil.getInstance().setHeight(370),
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(282),
              height: ScreenUtil.getInstance().setHeight(370),
              child: widget.foodImg,
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(500),
              height: ScreenUtil.getInstance().setHeight(370),
              color: Colors.white,
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: ScreenUtil.getInstance().setWidth(60),
                    ),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: ScreenUtil.getInstance().setWidth(60),
                      top: ScreenUtil.getInstance().setHeight(20),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          child: Text("\$" + (widget.price).toString()),
                        ),
                        test_FoodTypes[(widget.index % 3)],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(40),
              margin: EdgeInsets.only(
                right: ScreenUtil.getInstance().setWidth(50.0),
              ),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.expand_more),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(105),
              height: ScreenUtil.getInstance().setHeight(370),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.grey.shade400,
                    width: 0.6,
                  ),
                ),
              ),
              child: Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      color: Colors.lightGreen[100],
                      width: ScreenUtil.getInstance().setWidth(105),
                      height: ScreenUtil.getInstance().setHeight(114),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            foodCount++;
                          });
                        },
                        child: Container(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      height: ScreenUtil.getInstance().setHeight(2),
                    ),
                    Container(
                      height: ScreenUtil.getInstance().setHeight(110),
                      alignment: Alignment.center,
                      child: Text(
                        foodCount.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                      height: ScreenUtil.getInstance().setHeight(2),
                    ),
                    Container(
                      color: Colors.lightGreen[100],
                      width: ScreenUtil.getInstance().setWidth(105),
                      height: ScreenUtil.getInstance().setHeight(115),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (foodCount > 0) foodCount--;
                          });
                        },
                        child: Container(
                          child: Icon(
                            Icons.remove,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

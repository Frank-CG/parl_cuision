import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parl_cuision/scoped_model/food_model.dart';
import 'package:parl_cuision/scoped_model/order_model.dart';

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
  OrderModel orderModel = new OrderModel();
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

    // print("Image Height:" + widget.foodImg.height.toString());
    // print("Image Width :" + widget.foodImg.width.toString());

    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil.getInstance().setWidth(60), 0,
          ScreenUtil.getInstance().setWidth(60), 0),
      width: ScreenUtil.getInstance().setWidth(999),
      // height: ScreenUtil.getInstance().setHeight(340),
      child: Card(
        //child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(282),
              // height: ScreenUtil.getInstance().setHeight(340),
              child: widget.foodImg,
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(500),
              height: ScreenUtil.getInstance().setHeight(340),
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
              width: ScreenUtil.getInstance().setWidth(90),
              padding: EdgeInsets.only(
                right: ScreenUtil.getInstance().setWidth(50.0),
              ),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.expand_more),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(105),
              height: ScreenUtil.getInstance().setHeight(340),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      color: Colors.lightGreen[100],
                      width: ScreenUtil.getInstance().setWidth(105),
                      height: ScreenUtil.getInstance().setHeight(110),
                      child: GestureDetector(
                        onTap: () {
                          if(orderModel.foodOrder.length > widget.index){
                            orderModel.foodOrder[widget.index].setOrderCnt(foodCount + 1);
                            print(orderModel.foodOrder[widget.index]);
                          }else{
                            print("Error: foodOrder length :" + orderModel.foodOrder.length.toString());
                          }
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
                    // Divider(
                    //   color: Colors.grey.shade400,
                    //   height: ScreenUtil.getInstance().setHeight(2),
                    // ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(105),
                      height: ScreenUtil.getInstance().setHeight(80),
                      alignment: Alignment.center,
                      child: Text(
                        foodCount.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ),
                    // Divider(
                    //   color: Colors.grey.shade400,
                    //   height: ScreenUtil.getInstance().setHeight(2),
                    // ),
                    Container(
                      color: Colors.lightGreen[100],
                      width: ScreenUtil.getInstance().setWidth(105),
                      height: ScreenUtil.getInstance().setHeight(110),
                      child: GestureDetector(
                        onTap: () {
                          if(orderModel.foodOrder.length > widget.index){
                            orderModel.foodOrder[widget.index].setOrderCnt(foodCount - 1);
                            print(orderModel.foodOrder[widget.index]);
                          }else{
                            print("Error: foodOrder length :" + orderModel.foodOrder.length.toString());
                          }
                          
                          setState(() {
                            if (foodCount > 0){
                              foodCount--;
                            }
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
        //),
      ),
    );
  }
}

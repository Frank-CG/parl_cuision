import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parl_cuision/common/common.dart';
import 'package:parl_cuision/reservation/custom_picker.dart';
import 'package:parl_cuision/scoped_model/food_model.dart';
import 'package:parl_cuision/scoped_model/order_model.dart';

import 'checkout_dialog.dart';

class CheckoutPage extends StatefulWidget {
  Function(bool) callback;

  CheckoutPage({
    Key key,
    this.callback,
  }) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _defaultFontFamily = "Nunito Sans";

  final int steps_count = 3;
  final List<String> _stepTitles = <String>["REVIEW", "SET TIME", "CONFIRM"];
  int current_step = 0;
  double _kStepSize = 24.0;
  int _hour = -1;
  int _minute = -1;
  double totalPrice = 0;
  int itemsCount = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Scaffold(
      body: Container(
        width: ScreenUtil.getInstance().setWidth(1125),
        height: ScreenUtil.getInstance().setHeight(2436),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(350),
              padding:
                  EdgeInsets.only(top: ScreenUtil.getInstance().setHeight(190)),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      _navButtonOnPressed(false);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: _defaultFontFamily,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil.getInstance().setHeight(300),
              color: Colors.white,
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 14.0),
              child: _buildTopPath(steps_count),
            ),
            _getStepPage(current_step),
            _getBottomButton(current_step),
          ],
        ),
      ),
    );
  }

  void _navButtonOnPressed(bool isPlaced) {
    Navigator.pop(context, false);
    widget.callback(isPlaced);
  }

  Widget _buildTopPath(int stepCount) {
    List<Widget> children = <Widget>[];

    for (int i = 0; i < stepCount; i++) {
      children.add(_buildStep(i));
    }
    // children.add( _buildStep(stepCount-1, true) );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildStep(int index) {
    var stepTextStyle = TextStyle(
        fontSize: 10.0,
        fontFamily: "Nunito Sans",
        fontWeight: FontWeight.w700,
        color: _circleColor(index));
    List<Widget> step = <Widget>[];
    // if(index == 0){
    //   step.add(_buildLine(index,true));
    // }
    step.add(_buildLine(index, true));
    step.add(_buildCircle(index));
    step.add(_buildLine(index, false));
    // if(index == steps_count - 1){
    //   step.add(_buildLine(index, false));
    // }
    return Column(
      children: <Widget>[
        Row(
          children: step,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          _stepTitles[index],
          style: stepTextStyle,
        ),
      ],
    );
  }

  Widget _buildLine(int index, bool isLeft) {
    int comp_num = 0;
    dynamic length = ScreenUtil.getInstance().setWidth(120);
    if (isLeft) {
      comp_num = current_step;
    } else {
      comp_num = current_step - 1;
    }
    return Container(
      width: length,
      height: 1.0,
      color: index <= comp_num ? Colors.green : Colors.grey.shade400,
    );
  }

  Color _circleColor(int index) {
    return index <= current_step ? Colors.green : Colors.grey.shade400;
  }

  Widget _buildCircle(int index) {
    return Container(
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: Text(
            (index + 1).toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _getStepPage(int current_step) {
    Widget pageContent = null;
    switch (current_step) {
      case 0:
        pageContent = _getStepPageContent1();
        break;
      case 1:
        pageContent = _getStepPageContent2();
        break;
      case 2:
        pageContent = _getStepPageContent3();
        break;
      default:
        break;
    }

    return Container(
      height: ScreenUtil.getInstance().setHeight(1600),
      alignment: Alignment.topLeft,
      // color: Colors.lime,
      child: pageContent,
    );
  }

  Widget _getStepPageContent1() {
    List<FoodCard> orderItems = new List<FoodCard>();

    OrderModel om = new OrderModel();
    totalPrice = 0;
    itemsCount = 0;
    for (int i = 0; i < om.foodOrder.length; i++) {
      var fd = om.foodOrder[i];
      if (fd.orderCount > 0) {
        print(fd);
        totalPrice += fd.foodPrice * fd.orderCount;
        itemsCount += fd.orderCount;
        orderItems.add(
          FoodCard(
            index: fd.foodIndex - 1,
            foodImg: Image.asset(fd.foodImage),
            name: fd.foodName,
            price: fd.foodPrice,
            count: fd.orderCount,
            checkoutCallback: _itemChangeCallback,
          ),
        );
      }
    }

    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil.getInstance().setHeight(280),
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(63),
            top: ScreenUtil.getInstance().setHeight(90),
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "Review items below",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              fontFamily: _defaultFontFamily,
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(1000),
          child: Scaffold(
            body: ListView(
              children: orderItems,
              // children: <Widget>[
              //   FoodCard(
              //     foodImg: Image.asset("assets/images/food1.png"),
              //     name: "House soup",
              //     price: 7.00,
              //     count: 2,
              //   ),
              //   FoodCard(
              //     foodImg: Image.asset("assets/images/food2.png"),
              //     name: "Caesar salad",
              //     price: 8.00,
              //     count: 1,
              //   ),
              //   FoodCard(
              //     foodImg: Image.asset("assets/images/food3.png"),
              //     name: "Beet cured gravlax",
              //     price: 9.00,
              //     count: 3,
              //   ),
              // ],
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(320),
          color: Colors.white,
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(63),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(125),
                margin: EdgeInsets.only(
                  right: ScreenUtil.getInstance().setWidth(40),
                ),
                child: Image.asset(
                  "assets/images/icon_total.png",
                  width: ScreenUtil.getInstance().setWidth(120),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(520),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: _defaultFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$itemsCount items",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: _defaultFontFamily,
                        color: Colors.grey.shade400,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(300),
                child: Text(
                  "\$" + totalPrice.toString(),
                  style: TextStyle(
                      fontSize: 28.0,
                      fontFamily: _defaultFontFamily,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _itemChangeCallback() {
    setState(() {
      totalPrice = 0; //temp;
    });
  }

  Widget _getStepPageContent2() {
    // List<String> _hours = <String>["11", "12", "13", "14", "15"];
    List<String> _hours = <String>[];
    for(int i=0; i<24; i++){
      if(i<10){
        _hours.add("0"+i.toString());
      }else{
        _hours.add(i.toString());
      }
    }
    List<String> _minutes = <String>["00", "15", "30", "45"];
    String suffix = _hour > 11 ? "pm" : "am";
    String pickupTime = "$_hour:$_minute $suffix";

    TextStyle pickupTimeStyle = TextStyle(
        fontSize: 28.0,
        fontFamily: _defaultFontFamily,
        fontWeight: FontWeight.bold);

    if ((current_step == 1) && (_hour == -1 || _minute == -1)) {
      pickupTime = "Unselected";
      pickupTimeStyle = TextStyle(
        fontSize: 18.0,
        fontFamily: _defaultFontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      );
    }

    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil.getInstance().setHeight(280),
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(63),
            top: ScreenUtil.getInstance().setHeight(90),
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "Select pickup time",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              fontFamily: _defaultFontFamily,
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(1000),
          // margin: EdgeInsets.only(
          //   bottom: 30.0,
          // ),
          child: Column(
            children: <Widget>[
              _getCustomPicker("HOURS", _hours),
              _getCustomPicker("MINUTES", _minutes),
            ],
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(320),
          color: Colors.white,
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(63),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(125),
                margin: EdgeInsets.only(
                  right: ScreenUtil.getInstance().setWidth(40),
                ),
                child: Image.asset(
                  "assets/images/icon_pickuptime.png",
                  width: ScreenUtil.getInstance().setWidth(120),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(420),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pickup",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: _defaultFontFamily,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "time",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: _defaultFontFamily,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(400),
                child: Text(
                  pickupTime,
                  style: pickupTimeStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getCustomPicker(String title, List<String> options) {
    return CustomPicker(title, options, _customPickerCallback);
  }

  void _customPickerCallback(String selectedValue) {
    print(selectedValue);
    var temp = selectedValue.split(":");
    int value = int.parse(temp[1]);
    if (temp[0] == "HOURS") {
      setState(() {
        _hour = value;
      });
    } else if (temp[0] == "MINUTES") {
      setState(() {
        _minute = value;
      });
    }
  }

  Widget _getStepPageContent3() {
    List<Widget> bodyList = <Widget>[];
    bodyList.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(300),
            child: Text(
              "ITEMS",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(300),
            child: Text(
              "QUANTITY",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(280),
            child: Text(
              "PRICE",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    ));

    bodyList.add(Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Divider(
        color: Colors.grey.shade400,
        height: 2,
      ),
    ));

    OrderModel orderModel = new OrderModel();
    for (int i = 0; i < orderModel.foodOrder.length; i++) {
      FoodModel f = orderModel.foodOrder[i];
      if (f.orderCount > 0) {
        bodyList.add(_getOrderItem(f.foodName, f.orderCount.toString(),
            "\$" + (f.foodPrice * f.orderCount).toString()));
      }
    }

    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil.getInstance().setHeight(280),
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(120),
            top: ScreenUtil.getInstance().setHeight(90),
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "Confirm your order",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
              fontFamily: _defaultFontFamily,
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(850),
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(80),
            right: ScreenUtil.getInstance().setWidth(80),
            bottom: ScreenUtil.getInstance().setWidth(80),
          ),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 2.0,
            child: Scaffold(
              body: ListView(
                children: bodyList,
                // children: <Widget>[
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //       children: <Widget>[
                //         SizedBox(
                //           width: ScreenUtil.getInstance().setWidth(300),
                //           child: Text(
                //             "ITEMS",
                //             textAlign: TextAlign.left,
                //             style: TextStyle(
                //               fontSize: 16.0,
                //               fontFamily: _defaultFontFamily,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.grey.shade400,
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: ScreenUtil.getInstance().setWidth(300),
                //           child: Text(
                //             "QUANTITY",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               fontSize: 16.0,
                //               fontFamily: _defaultFontFamily,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.grey.shade400,
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           width: ScreenUtil.getInstance().setWidth(280),
                //           child: Text(
                //             "PRICE",
                //             textAlign: TextAlign.right,
                //             style: TextStyle(
                //               fontSize: 16.0,
                //               fontFamily: _defaultFontFamily,
                //               fontWeight: FontWeight.w600,
                //               color: Colors.grey.shade400,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 8.0,
                //       right: 8.0,
                //     ),
                //     child: Divider(
                //       color: Colors.grey.shade400,
                //       height: 2,
                //     ),
                //   ),
                //   _getOrderItem("House soup", "2", "\$14.00"),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 8.0,
                //       right: 8.0,
                //     ),
                //     child: Divider(
                //       color: Colors.grey.shade400,
                //       height: 2,
                //     ),
                //   ),
                //   _getOrderItem("Caesar salad", "1", "\$8.00"),
                //   Padding(
                //     padding: const EdgeInsets.only(
                //       left: 8.0,
                //       right: 8.0,
                //     ),
                //     child: Divider(
                //       color: Colors.grey.shade400,
                //       height: 2,
                //     ),
                //   ),
                //   _getOrderItem("Brussel sprouts", "2", "\$14.00"),
                // ],
              ),
            ),
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(320),
          color: Colors.white,
          padding: EdgeInsets.only(
            left: ScreenUtil.getInstance().setWidth(63),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(100),
                margin: EdgeInsets.only(
                  right: ScreenUtil.getInstance().setWidth(40),
                ),
                child: Image.asset(
                  "assets/images/icon_pickuptime.png",
                  width: ScreenUtil.getInstance().setWidth(100),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(340),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pickup time",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: _defaultFontFamily,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "$_hour:$_minute pm",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: _defaultFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(320),
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(100),
                margin: EdgeInsets.only(
                  right: ScreenUtil.getInstance().setWidth(40),
                ),
                child: Image.asset(
                  "assets/images/icon_total.png",
                  width: ScreenUtil.getInstance().setWidth(100),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(340),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: _defaultFontFamily,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$$totalPrice",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: _defaultFontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: ScreenUtil.getInstance().setHeight(150),
          child: Align(
            alignment: Alignment(0, 0),
            child: Text(
              "ADD ORDER COMMENTS",
              style: TextStyle(
                fontSize: 12,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getOrderItem(String name, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(300),
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(300),
            child: Text(
              quantity,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(280),
            child: Text(
              price,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: _defaultFontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomButton(int current_step) {
    String buttonText = "Next";
    if (current_step == 2) {
      buttonText = "Place order";
    }
    Color buttonColor = Colors.green;
    if ((current_step == 1) && (_hour == -1 || _minute == -1)) {
      buttonColor = Colors.grey.shade500;
    }

    return GestureDetector(
      onTap: _nextStep,
      child: Container(
        height: ScreenUtil.getInstance().setHeight(186),
        width: ScreenUtil.getInstance().setWidth(1125),
        alignment: Alignment(0, 0),
        color: buttonColor,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: _defaultFontFamily,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _nextStep() {
    print(current_step);
    if ((current_step == 1) && (_hour == -1 || _minute == -1)) {
      return;
    }
    setState(() {
      if (current_step < 2) {
        current_step++;
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
                title: "Success!",
                pickup_time: "$_hour:$_minute",
                buttonText: "OK",
                checkoutCallback: () {
                  _navButtonOnPressed(true);
                },
              ),
        );
        // _navButtonOnPressed();
      }
    });
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parl_cuision/common/common.dart';

class CheckoutPage extends StatefulWidget {
  // CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _defaultFontFamily = "Nunito Sans";

  final int steps_count = 3;
  final List<String> _stepTitles = <String>["REVIEW", "SET TIME", "CONFIRM"];
  int current_step = 0;
  double _kStepSize = 24.0;

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
                    onPressed: _navButtonOnPressed,
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

  void _navButtonOnPressed() {
    Navigator.pop(context, false);
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
    return Container(
      height: ScreenUtil.getInstance().setHeight(1600),
      alignment: Alignment.topLeft,
      // color: Colors.lime,
      child: Column(
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
          FoodCard(foodImg: Image.asset("assets/images/food1.png"), name: "House soup", price: "\$7", count: 2,),
        ],
      ),
    );
  }

  Widget _getBottomButton(int current_step) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(186),
      width: ScreenUtil.getInstance().setWidth(1125),
      alignment: Alignment(0, 0),
      color: Colors.green,
      child: Text(
        "Next",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: _defaultFontFamily,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

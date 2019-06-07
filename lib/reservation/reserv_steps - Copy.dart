import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservSteps extends StatefulWidget {
  @override
  _ReservStepsState createState() => new _ReservStepsState();
}

class _ReservStepsState extends State<ReservSteps> {
  
  int current_step = 0;
  List<Step> my_steps = [
    new Step(
        // Title of the Step
        title: new Text("1"),
        // Content, it can be any widget here. Using basic Text for this example
        content: new Text("Hello!"),
        state: StepState.indexed,
        isActive: true),
    new Step(
        title: new Text("2"),
        content: new Text("World!"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.indexed,
        isActive: true),
    new Step(
        title: new Text("3"),
        content: new Text("Hello World!"),
        state: StepState.indexed,
        isActive: true),
    new Step(
        title: new Text("4"),
        content: new Text("Hello World!"),
        state: StepState.indexed,
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    return Scaffold(
      body: Container(
        child: Stepper(
          currentStep: this.current_step,
          steps: my_steps,
          type: StepperType.horizontal,
          // onStepTapped: (step) {
          //   setState(() {
          //     current_step = step;
          //   });
          //   print("onStepTapped : " + step.toString());
          // },

          // controlsBuilder: (BuildContext context,
          //     {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          //   return Row(
          //     children: <Widget>[
          //       Container(
          //         child: null,
          //       ),
          //       Container(
          //         child: null,
          //       ),
          //     ],
          //   );
          // },

          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: ScreenUtil.getInstance().setWidth(900),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: ButtonTheme(
                      minWidth: ScreenUtil.getInstance().setWidth(850),
                      child: current_step == 2 // this is the last step
                          ? RaisedButton.icon(
                              icon: Icon(Icons.create),
                              onPressed: () => {},
                              label: Text('CREATE'),
                              color: Colors.green,
                            )
                          : RaisedButton(
                              // icon: Icon(Icons.navigate_next),                              
                              // label: Text('Next Step'),
                              onPressed: onStepContinue,
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text("Next Step"),
                            ),
                    ),
                  ),
                  // FlatButton.icon(
                  //   icon: Icon(Icons.delete_forever),
                  //   label: const Text('CANCEL'),
                  //   onPressed: onStepCancel,
                  // ),
                ],
              ),
            );
          },

          // onStepCancel: () {
          //   setState(() {
          //     if (current_step > 0) {
          //       current_step = current_step - 1;
          //     } else {
          //       current_step = 0;
          //     }
          //   });
          //   print("onStepCancel : " + current_step.toString());
          // },
          onStepContinue: () {
            setState(() {
              if (current_step < my_steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
            print("onStepContinue : " + current_step.toString());
          },
        ),
      ),
    );
  }
}

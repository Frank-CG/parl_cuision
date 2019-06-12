import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomPicker extends StatefulWidget {
  List<String> _options = <String>[];
  String _title = "";
  Function(String) callback;

  CustomPicker(this._title, this._options, this.callback);
  _CustomPickerState createState() => _CustomPickerState();

  }
  
  class _CustomPickerState extends State<CustomPicker> {
    int _selectedIndex = -1;
    int _startIndex;
    int _endIndex;
    int _pageShowedCount;
  
    
  
    TextStyle selectedStyle = TextStyle(
      fontSize: 18.0,
      fontFamily: "Nunito Sans",
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    TextStyle unSelectedStyle = TextStyle(
      fontSize: 18.0,
      fontFamily: "Nunito Sans",
      color: Colors.grey.shade600,
      fontWeight: FontWeight.bold,
    );
  
    TextStyle titleStyle = TextStyle(
      fontSize: 12.0,
      fontFamily: "Nunito Sans",
      fontWeight: FontWeight.bold,
    );
  
    @override
    void initState() {
      super.initState();
  
      _pageShowedCount = 5;
      _startIndex = 0;
      _endIndex = widget._options.length - 1;
      if (_endIndex > _pageShowedCount - 1) {
        _startIndex =
            ((widget._options.length - _pageShowedCount) / 2).truncate();
        _endIndex = _startIndex + _pageShowedCount;
      }
  }

  
  void _itemOnSelected(int index) {
    setState(() {
      _selectedIndex = index;
      widget.callback(widget._title + ":" + widget._options[index]);
    });
  }

  Widget _getItem(int index) {
    var contentStyle =
        index == _selectedIndex ? selectedStyle : unSelectedStyle;
    Color decorationColor =
        index == _selectedIndex ? Colors.green : Colors.transparent;
    return GestureDetector(
      onTap: () {
        _itemOnSelected(index);
      },
      child: Container(
        width: 60.0,
        height: 30.0,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
          color: decorationColor,
          borderRadius: BorderRadius.all(const Radius.circular(30.0)),
        ),
        child: new Text(
          widget._options[index],
          style: contentStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _ops = <Widget>[];
    for (int i = 0; i < widget._options.length; i++) {
      _ops.add(_getItem(i));
    }
    Widget selector;

    ScrollController _scrollController = new ScrollController(initialScrollOffset: 60.0*7);
    
    if (widget._title == "HOURS") {
      selector = ListView(
        scrollDirection: Axis.horizontal,
        children: _ops,
        controller: _scrollController,
      );
    } else {
      selector = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _ops,
      );
    }
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
          child: Text(
            widget._title,
            style: titleStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300],
              width: 1.0,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          ),
          child: selector,
        ),
      ],
    );
  }
}

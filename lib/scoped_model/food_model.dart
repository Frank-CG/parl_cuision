
class FoodModel {
  int _foodIndex;
  String _foodImage;
  String _foodType;
  String _foodName;
  double _foodPrice;
  int _orderCount;

  FoodModel(int index, String imgPath, String type, String name, double price, int count) {
    this._foodIndex = index;
    this._foodImage = imgPath;
    this._foodType = type;
    this._foodName = name;
    this._foodPrice = price;
    this._orderCount = count;
  }

  String toString(){
    return "$_foodIndex : $_foodName : $_foodPrice : $_orderCount";
  }

  void setOrderCnt(int c){
    this._orderCount = c;
  }

  void orderCntOper(bool isAdd){
    if(isAdd){
      _orderCount++;
    }else{
      if(_orderCount > 0)
        _orderCount--;
    }
  }

  int get foodIndex => _foodIndex;
  String get foodImage => _foodImage;
  String get foodType => _foodType;
  String get foodName => _foodName;
  double get foodPrice => _foodPrice;
  int get orderCount => _orderCount;

}
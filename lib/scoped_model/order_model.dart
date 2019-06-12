import 'package:parl_cuision/scoped_model/food_model.dart';

class OrderModel {
  List<FoodModel> foodOrder = new List<FoodModel>();
  static final OrderModel _singleton = new OrderModel._internal();
    
  factory OrderModel() {
    return _singleton;
  }

  OrderModel._internal();

  void refreshOrder(){
    this.foodOrder = new List<FoodModel>();
  }
  
}
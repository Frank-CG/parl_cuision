import 'package:parl_cuision/scoped_model/food_model.dart';

class OrderModel {
  final List<FoodModel> foodOrder = new List<FoodModel>();
  static final OrderModel _singleton = new OrderModel._internal();
    
  factory OrderModel() {
    return _singleton;
  }

  OrderModel._internal();
  
}
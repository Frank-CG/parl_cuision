import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:parl_cuision/menu/menu_foodcard.dart';
import 'package:parl_cuision/scoped_model/food_model.dart';
import 'package:parl_cuision/scoped_model/order_model.dart';

Future<List<Food>> fetchFoods(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos?albumId=1');

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseFoods, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Food> parseFoods(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Food>((json) => Food.fromJson(json)).toList();
}

class Food {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Food({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class FoodCardList extends StatefulWidget {
  FoodCardList(this.isHealthy, this.isVegetarian, this.isVegan);

  bool isHealthy;
  bool isVegetarian;
  bool isVegan;

  @override
  State<FoodCardList> createState() => _FoodCardListState();
}

class _FoodCardListState extends State<FoodCardList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        child: FutureBuilder<List<Food>>(
          future: fetchFoods(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            List<Food> foodList;
            if (snapshot.hasData) {
              buildModel(snapshot.data);
              foodList = filterFoods(snapshot.data, widget.isHealthy,
                  widget.isVegetarian, widget.isVegan);
            }

            return snapshot.hasData
                ? FoodList(
                    foods:
                        foodList) //FoodList(foods: snapshot.data, isHealthy: widget.isHealthy, isVegetarian: widget.isVegetarian, isVegan: widget.isVegan,)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      ),
    );
  }

  void buildModel(List<Food> list) {
    List<String> test_foodNames = <String>[
      "House soup",
      "Caesar salad",
      "Beet cured gralax"
    ];
    var md = new OrderModel();
    for (int i = 0; i < list.length; i++) {
      var f = list[i];
      FoodModel fd = new FoodModel(
          f.id,
          "assets/images/food" + ((f.id - 1) % 3 + 1).toString() + ".png",
          (f.id - 1).toString(),
          test_foodNames[(f.id - 1) % 3],
          7.00 + (f.id - 1) % 5,
          0);
      md.foodOrder.add(fd);
    }
  }

  List<Food> filterFoods(
      List<Food> list, bool healthy, bool vegetarain, bool vegan) {
    var result = list
        .where((f) => ((((f.id % 3 == 1) && healthy) ||
                ((f.id % 3 == 2) && vegetarain) ||
                ((f.id % 3 == 0) && vegan)) &&
            (f.id < 15)))
        .toList();
    // print("Length:"+result.length.toString());
    // for(int i=0; i<result.length; i++){
    //   print(result[i].id);
    // }
    return result;
  }
}

class FoodList extends StatelessWidget {
  final List<Food> foods;
  // final bool isHealthy;
  // final bool isVegetarian;
  // final bool isVegan;

  FoodList({
    Key key,
    this.foods,
    // this.isHealthy,
    // this.isVegetarian,
    // this.isVegan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 1125, height: 2436, allowFontScaling: true)
          ..init(context);

    List<String> test_foodNames = <String>[
      "House soup",
      "Caesar salad",
      "Beet cured gralax"
    ];

    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            MenuFoodCard(
              foodImg: Image.asset(
                "assets/images/food" +
                    ((foods[index].id - 1) % 3 + 1).toString() +
                    ".png",
                // height: ScreenUtil.getInstance().setHeight(370),
                // width: ScreenUtil.getInstance().setWidth(282),
              ),
              name: test_foodNames[index % 3],
              price: 7.00 + index % 5,
              index: foods[index].id - 1,
            ),
          ],
        );
      },
    );
  }

  Widget getNetworkImage(int index) {
    if (index == 0) {
      return Image.asset(
        "assets/images/food1.png",
        fit: BoxFit.cover,
        height: 100,
      );
    } else {
      return Image.network(
        foods[index].thumbnailUrl,
        fit: BoxFit.cover,
      );
    }
  }
}

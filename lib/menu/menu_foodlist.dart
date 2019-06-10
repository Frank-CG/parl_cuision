import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parl_cuision/menu/menu_foodcard.dart';

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

            return snapshot.hasData
                ? FoodList(foods: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final List<Food> foods;

  FoodList({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> test_foodNames = <String>[
      "House soup",
      "Caesar salad",
      "Beet cured gralax"
    ];

    return ListView.builder(
      itemCount: foods.length > 15 ? 15 : foods.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            MenuFoodCard(
              foodImg: Image.asset(
                  "assets/images/food" + (index % 3 + 1).toString() + ".png"),
              name: test_foodNames[index % 3],
              price: 7.00 + index % 5,
              index: index,
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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future<List<Food>> fetchFoods(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');

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
          builder: (context,snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData ? FoodList(foods: snapshot.data) : Center(child: CircularProgressIndicator(),);
          },
        ),
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
      ),
    );
  }
  
}


class FoodList extends StatelessWidget {
  final List<Food> foods;

  FoodList({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(
                  // height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 70.0,
                  height: 98,
                ),
                color: Colors.white10,
                alignment: Alignment.center,
                child: Card(
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(18.0),
                  // ),
                  child: Row(children: <Widget>[
                    Container(
                      child: Column(children: <Widget>[Image.asset("assets/images/food1.png", fit: BoxFit.cover, width: 90, height: 90,),],),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 20,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 20.0,),
                                Text("House soup",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                SizedBox(width: 40.0,),
                                Icon(Icons.expand_more),
                                SizedBox(width: 20.0,),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 20.0,),
                                Text("\$7",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.green,),),
                                Icon(Icons.event_busy, color: Colors.green,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey,width: 1,))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.add, color: Colors.green,),
                            Divider(color: Colors.grey,height: .6,),
                            Text("0",style: TextStyle(fontSize: 18, color: Colors.green),),
                            Divider(color: Colors.grey,height: .6,),
                            Icon(Icons.remove, color: Colors.green,),
                          ],
                        ),
                      ),
                    ),
                  ],),
                )),
            // SizedBox(height: 20,),
          ],
        );
      },
    );
  }

  Widget getNetworkImage(int index){
    if(index == 0){
      return Image.asset("assets/images/food1.png", fit: BoxFit.cover, height: 100,);
    }else{
      return Image.network(
                          foods[index].thumbnailUrl,
                          fit: BoxFit.cover,
                        );
    }
  }
}
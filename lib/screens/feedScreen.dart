import 'dart:ui';

import 'package:courceapp/utils/api.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool isFavorate = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await getFeedDatas();
    setState(() {}); // Update the UI after getting data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: feedData!.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        feedData!.data[index].file,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorate = !isFavorate;
                                });
                              },
                              icon: isFavorate
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_outline,
                                      color: Colors.red,
                                    )),
                          Text(feedData!.data[index].isLiked.toString() +
                              ' Likes')
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        'assets/images/whtsapp.png')),
                                Container(
                                  height: 30,
                                  width: 20,
                                  child: Image.network(
                                      'https://cdn-icons-png.freepik.com/512/6165/6165217.png'),
                                ),
                              ],
                            ),
                            Text(
                              feedData!.data[index].date,
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    feedData!.data[index].title,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Text(
                    feedData!.data[index].content
                        .replaceAll(RegExp(r'<[^>]+>'), ''),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

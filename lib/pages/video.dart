import 'package:flutter/material.dart';

class Video extends StatelessWidget{
  static const String routeName = "/video";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Icon(Icons.ondemand_video,
                size: 170.0,
                color: Colors.green),
            Text("tercer Tab")
          ],
        )
    );
  }
}
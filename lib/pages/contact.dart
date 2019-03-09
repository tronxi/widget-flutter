import 'package:flutter/material.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Icon(Icons.contacts,
                size: 170.0,
                color: Colors.green),
            Text("Primer Tab")
          ],
        )
    );
  }

}
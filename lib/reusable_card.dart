import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild, @required this.height});

  final Color colour;
  final Widget cardChild;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: height,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}
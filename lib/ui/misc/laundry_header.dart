import 'package:flutter/material.dart';

class LaundryHeader extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  LaundryHeader(this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    final containerHeight = screenHeight * 0.18;
    return Container(
      height: containerHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Color(0xffE5F5F6),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(containerHeight * 0.25),
          bottomRight: Radius.circular(containerHeight * 0.25),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/clothes.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "LAUNDRY",
                  style: TextStyle(
                    fontSize: containerHeight * 0.18,
                  ),
                ),
                Text("Wash, Dry, and Fold",
                    style: TextStyle(
                      fontSize: containerHeight * 0.10,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

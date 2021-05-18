import 'package:flutter/material.dart';

import '../../../../../custom_icons.dart';

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  List<String> title = ['Every 3 days', 'Every 5 days', 'Every 7 days'];
  int selectedIndex;
  int selectedIndex2;

  int val = 1;

  void initState() {
    super.initState();
    val = 1;
  }

  void add() {
    setState(() {
      if (val < 15) {
        val += 1;
      }
    });
  }

  void minus() {
    setState(() {
      if (val != 1) {
        val -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.2,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Laundry Weight',
                  style: TextStyle(
                    fontSize: screenHeight * 0.024,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => minus(),
                            icon: Icon(CustomIcons.remove_circle_outline),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              val.toString(),
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          IconButton(
                            onPressed: () => add(),
                            icon: Icon(CustomIcons.add_circle_outline),
                            color: Theme.of(context).primaryColor,
                            splashColor: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Note: Max. 15 kg. If more than 15 kg, please contact Dorry Management',
                        style: TextStyle(
                          fontSize: screenHeight * 0.014,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              Container(
                width: screenWidth,
                child: Text(
                  'Pick up day',
                  style: TextStyle(
                    fontSize: screenHeight * 0.024,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customButton(title[0], 0),
                  customButton(title[1], 1),
                  customButton(title[2], 2),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Container(
                width: screenWidth,
                child: Text(
                  'Delivery day',
                  style: TextStyle(
                    fontSize: screenHeight * 0.024,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customButton2(title[0], 0),
                  customButton2(title[1], 1),
                  customButton2(title[2], 2),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customButton(String title, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FlatButton(
      onPressed: () => changeIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: selectedIndex == index
          ? Theme.of(context).primaryColor
          : Colors.white,
      child: Text(
        title,
        style: TextStyle(fontSize: screenHeight * 0.014),
      ),
    );
  }

  void changeIndex2(int index) {
    setState(() {
      selectedIndex2 = index;
    });
  }

  Widget customButton2(String title, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FlatButton(
      onPressed: () => changeIndex2(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: selectedIndex2 == index
          ? Theme.of(context).primaryColor
          : Colors.white,
      child: Text(
        title,
        style: TextStyle(fontSize: screenHeight * 0.014),
      ),
    );
  }
}

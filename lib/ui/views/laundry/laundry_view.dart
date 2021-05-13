import 'package:dorry_v1/custom_icons.dart';
import 'package:dorry_v1/ui/misc/laundry_header.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'laundry_viewmodel.dart';

class LaundryView extends StatefulWidget {
  const LaundryView({Key key}) : super(key: key);

  @override
  _LaundryViewState createState() => _LaundryViewState();
}

class _LaundryViewState extends State<LaundryView> {
  List<String> title = ['trial', 'basic', 'plus', 'pro'];
  List<String> price = ['35', '33', '31', '30'];
  List<String> cent = ['00', '25', '50', '00'];
  List<String> duration = ['14 days', '1 month', '3 months', '6 months'];

  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CustomIcons.angle_left,
                size: 30,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LaundryHeader(screenHeight, screenWidth),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose your plan",
                      style: TextStyle(
                        fontSize: screenHeight * 0.026,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Wrap(
                        spacing: screenWidth * 0.075,
                        runSpacing: screenWidth * 0.075,
                        alignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          customButton(
                              title[0], price[0], cent[0], duration[0], 0),
                          customButton(
                              title[1], price[1], cent[1], duration[1], 1),
                          customButton(
                              title[2], price[2], cent[2], duration[2], 2),
                          customButton(
                              title[3], price[3], cent[3], duration[3], 3),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: '************7623',
                            hintStyle: TextStyle(fontSize: 16),
                            prefixIcon: Icon(Icons.payment_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Color(0xFFe5e5e5),
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'See Terms and Conditions',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onPressed: () {
                        model.navigateToLaundry();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LaundryViewModel(),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customButton(
      String title, String price, String cent, String duration, int index) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return OutlineButton(
      onPressed: () => changeIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      borderSide: BorderSide(
        color: selectedIndex == index
            ? Theme.of(context).accentColor
            : Color(0xFFe5e5e5),
      ),
      child: Container(
          height: screenWidth * 0.31,
          width: screenWidth * 0.26,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'P ' + price,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '.' + cent,
                          style: TextStyle(fontSize: 8),
                        ),
                        Text(
                          'per kilo',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  duration,
                  style: TextStyle(fontSize: 8),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  List<String> title = [
    'Laundry Fee',
    'Monthly Fee',
    'Delivery Fee',
    'Service Fee'
  ];
  List<double> amount = [99.75, 997.50, 1000.00, 200.00];
  double total_amount = 2197.50;
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
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
          Text(
            'Payment Details',
            style: TextStyle(
              fontSize: screenHeight * 0.024,
            ),
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                details(title[0], amount[0]),
                SizedBox(height: 10),
                details(title[1], amount[1]),
                SizedBox(height: 10),
                details(title[2], amount[2]),
                SizedBox(height: 10),
                details(title[3], amount[3]),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: screenWidth * 0.35,
                      child: Text(
                        'Total Amount',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.1,
                      child: Text(
                        ':',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.35,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'P ' + total_amount.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Charges starts after your chosen start date: September 3, 2021',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Payment Method',
            style: TextStyle(
              fontSize: screenHeight * 0.024,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: screenWidth,
            child: Text(
              'See Terms and Conditions',
              style: TextStyle(
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Transform.scale(
                  scale: 1,
                  child: Switch(
                    onChanged: toggleSwitch,
                    value: isSwitched,
                    activeColor: Theme.of(context).accentColor,
                    activeTrackColor: Theme.of(context).accentColor,
                    inactiveThumbColor: Color(0xffc4c4c4),
                    inactiveTrackColor: Color(0xffc4c4c4),
                  )),
              Text(
                'I have read and agree to the terms of service',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget details(String title, double amount) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          child: Text(title),
        ),
        Container(
          width: screenWidth * 0.1,
          child: Text(':'),
        ),
        Container(
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
              ),
            ),
          ),
          child: Text('P ' + amount.toString()),
        ),
      ],
    );
  }
}

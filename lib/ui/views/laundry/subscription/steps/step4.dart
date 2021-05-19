import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class Step4 extends StatefulWidget {
  @override
  _Step4State createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  List<String> title = [
    'Laundry Fee',
    'Monthly Fee',
    'Delivery Fee',
    'Service Fee'
  ];
  List<String> title2 = [
    'Laundry Weight',
    'Pick up days',
    'Delivery days',
    'Start date'
  ];
  List<String> data = [
    '3 kilograms',
    'Every 3 days',
    'Every 3 days',
    'September 3, 2021'
  ];
  List<double> amount = [99.75, 997.50, 1000.00, 200.00];
  double total_amount = 2197.50;
  bool isSwitched = false;

  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

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
        children: [
          Text(
            'Review your Plan',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              children: [
                details2(title2[0], data[0]),
                SizedBox(height: 10),
                details2(title2[1], data[1]),
                SizedBox(height: 10),
                details2(title2[2], data[2]),
                SizedBox(height: 10),
                details2(title2[3], data[3]),
                SizedBox(height: 20),
                Container(width: screenWidth, child: Text('Schedule')),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 15,
                      width: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text('Pick up Day'),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 15,
                      width: 15,
                      color: Theme.of(context).accentColor,
                    ),
                    Text('Delivery Day'),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffE5F5F6).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TableCalendar(
                        initialCalendarFormat: CalendarFormat.month,
                        calendarStyle: CalendarStyle(
                            todayColor: Theme.of(context).primaryColor,
                            selectedColor: Theme.of(context).accentColor,
                            todayStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                color: Colors.white)),
                        headerStyle: HeaderStyle(
                          centerHeaderTitle: true,
                          formatButtonVisible: false,
                        ),
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        onDaySelected: (date, events, e) {
                          print(date.toUtc());
                        },
                        builders: CalendarBuilders(
                          selectedDayBuilder: (context, date, events) =>
                              Container(
                            margin: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          todayDayBuilder: (context, date, events) => Container(
                            margin: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        calendarController: _controller,
                      )
                    ],
                  ),
                ),
              ],
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

  Widget details2(String title, String data) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.40,
          child: Text(title),
        ),
        Container(
          width: screenWidth * 0.05,
          child: Text(':'),
        ),
        Container(
          width: screenWidth * 0.40,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
              ),
            ),
          ),
          child: Text(data),
        ),
      ],
    );
  }
}

import 'dart:ffi';

import 'package:dorry_v1/ui/misc/laundry_header.dart';
import 'package:dorry_v1/ui/views/laundry/subscription/steps/step1.dart';
import 'package:dorry_v1/ui/views/laundry/subscription/steps/step2.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../custom_icons.dart';
import 'laundry_subscription_viewmodel.dart';
import 'package:im_stepper/stepper.dart';

class LaundrySubscriptionView extends StatefulWidget {
  const LaundrySubscriptionView({Key key}) : super(key: key);

  @override
  _LaundrySubscriptionViewState createState() =>
      _LaundrySubscriptionViewState();
}

class _LaundrySubscriptionViewState extends State<LaundrySubscriptionView> {
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
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              LaundryHeader(screenHeight, screenWidth),
              StepContent(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LaundrySubscriptionViewModel(),
    );
  }
}

class StepContent extends StatefulWidget {
  @override
  _StepContentState createState() => _StepContentState();
}

class _StepContentState extends State<StepContent> {
  String buttontext = "NEXT";
  int activeStep = 0;
  int dotCount = 4;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BASIC PLAN'),
                  Text(
                    '1 month',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'P 33',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '.25',
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
            ],
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          DotStepper(
            dotCount: 4,
            dotRadius: 6,
            activeStep: activeStep,
            shape: Shape.circle,
            spacing: screenWidth * 0.2,
            indicator: Indicator.shift,
            onDotTapped: (tappedDotIndex) {
              setState(() {
                activeStep = tappedDotIndex;
              });
            },
            fixedDotDecoration: FixedDotDecoration(
              strokeColor: Colors.blueGrey[200],
              color: Colors.white,
              strokeWidth: 1,
            ),
            indicatorDecoration: IndicatorDecoration(
              color: Theme.of(context).primaryColor,
              strokeColor: Theme.of(context).primaryColor,
            ),
            lineConnectorsEnabled: true,
            lineConnectorDecoration: LineConnectorDecoration(
              color: Colors.blueGrey[200],
              strokeWidth: 1,
            ),
          ),
          switchForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [previousButton(), nextButton()],
          )
        ],
      ),
    );
  }

  switchForm() {
    switch (activeStep) {
      case 0:
        buttontext = 'NEXT';
        return Container(
          child: Step1(),
        );
      case 1:
        buttontext = 'NEXT';
        return Container(
          child: Step2(),
        );
      case 2:
        buttontext = 'NEXT';
        return Container(
          child: Text('step 3'),
        );
      case 3:
        buttontext = 'SUBSCRIBE';
        return Container(
          child: Text('step 4'),
        );
      default:
    }
  }

  Widget nextButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Container(
        height: 50,
        width: screenWidth * 0.30,
        alignment: Alignment.center,
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 18),
        ),
      ),
      onPressed: () {
        if (activeStep < dotCount - 1) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(width: 1, color: Color(0xffc4c4c4)),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Container(
        height: 50,
        width: screenWidth * 0.30,
        alignment: Alignment.center,
        child: Text(
          'CANCEL',
          style: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ),
      onPressed: () {
        // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
    );
  }
}

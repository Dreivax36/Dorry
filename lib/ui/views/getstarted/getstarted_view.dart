import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'get_started_info.dart';
import 'getstarted_viewmodel.dart';
import 'slide_dots.dart';
import 'slide_item.dart';

class GetStartedView extends StatefulWidget {
  @override
  const GetStartedView({Key key}) : super(key: key);

  _GetStartedViewState createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<GetStartedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/upper-right.svg',
                width: screenWidth * 0.75,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/svg/lower-left.svg',
                width: screenWidth * 0.45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.10,
                  ),
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Container(
                    //margin: const EdgeInsets.only(bottom: 35),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < slideList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.10,
                  ),
                  Container(
                    height: 40,
                    width: screenWidth / 1.38,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(70, 183, 191, 1),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: FlatButton(
                      onPressed: () {
                        model.nagivateToHome();
                      },
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => GetStartedViewModel(),
    );
  }
}

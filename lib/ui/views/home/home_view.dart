import 'package:dorry_v1/custom_icons.dart';
import 'package:dorry_v1/ui/misc/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CustomIcons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(CustomIcons.notification),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header('Macel'),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    suffixIcon: Icon(CustomIcons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    fillColor: Color(0xffF2F2F2),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  height: screenHeight * 0.25,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: Color(0xffE5F5F6),
                    borderRadius: BorderRadius.circular(10),
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
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Ain’t got time for your dirty laundry?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 16),
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: screenWidth * 0.40,
                              child: Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColor,
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ))),
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'SUBSCRIBE NOW',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  onPressed: () {
                                    model.navigateToLaundry();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Categories(),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNav(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class Header extends StatelessWidget {
  final String name;

  Header(this.name);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hello, ',
          style: TextStyle(fontSize: screenHeight * 0.04),
        ),
        Text(name + '!',
            style: TextStyle(
                fontSize: screenHeight * 0.04, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffE5F5F6),
                offset: const Offset(
                  5.0,
                  4.0,
                ),
                blurRadius: 20.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          width: screenWidth * 0.42,
          height: screenHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 3, child: Image.asset('assets/images/laundry.png')),
              Expanded(
                flex: 1,
                child: Text(
                  "Laundry",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xffE5F5F6),
                offset: const Offset(
                  5.0,
                  4.0,
                ),
                blurRadius: 20.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          width: screenWidth * 0.42,
          height: screenHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 3, child: Image.asset('assets/images/Groceries.png')),
              Expanded(
                flex: 1,
                child: Text(
                  "Grocery",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

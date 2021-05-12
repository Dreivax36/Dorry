import 'package:dorry_v1/custom_icons.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Icon(
              CustomIcons.home,
              size: 28,
              color: Theme.of(context).primaryColor,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              CustomIcons.calendar,
              size: 28,
            ),
          ),
          SizedBox(
            height: 40,
            width: 70,
            child: Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ))),
                child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                    )),
                onPressed: () {},
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              CustomIcons.subscribe,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              CustomIcons.user,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

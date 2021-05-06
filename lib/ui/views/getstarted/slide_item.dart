import 'package:dorry_v1/ui/views/getstarted/get_started_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          slideList[index].title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 20),
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl),
              scale: 1,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            slideList[index].description,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 16),
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 4,
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

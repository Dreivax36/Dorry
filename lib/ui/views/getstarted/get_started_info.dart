import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/laundry.png',
    title: 'Laundry Service',
    description:
        'Contains a series of questions for assessing your health condition in connection with the current COVID-19 situation',
  ),
  Slide(
    imageUrl: 'assets/images/Groceries.png',
    title: 'Groceries To Go',
    description:
        'No need to remember past locations or encountered persons. Your engagements are recorded by you at all times.',
  ),
  Slide(
    imageUrl: 'assets/images/delivery.png',
    title: 'Delivered to You',
    description:
        'Scan or enter the code to record your location or the person you are meeting with.',
  ),
];

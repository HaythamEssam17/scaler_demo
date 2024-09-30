import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'shared_texts.dart';

void devLog(String errorMessage) {
  developer.log('developer log: $errorMessage');
}

/// Calculate %
String calculatePercentage(String price, String discount) {
  return ((double.parse(discount) * double.parse(price)) / (100)).toStringAsFixed(2);
}

/// Calculate Total Price
String calculateTotalPrice(String price, String discount) {
  return (double.parse(price) - double.parse(calculatePercentage(price, discount))).toStringAsFixed(2);
}

/// Get Widget Height
double getWidgetHeight(double height) {
  return SharedText.screenHeight * (height / 812);
}

/// Get Widget Width
double getWidgetWidth(double width) {
  return SharedText.screenWidth * (width / 375);
}

/// Get Space Height
SizedBox getSpaceHeight(double height) {
  final double currentHeight = SharedText.screenHeight * (height / 812);
  return SizedBox(height: currentHeight);
}

/// Get Space Width
SizedBox getSpaceWidth(double width) {
  final double currentWidth = SharedText.screenWidth * (width / 375);
  return SizedBox(width: currentWidth);
}

///convert from sec to min
String secToMin(int sec) {
  return '${sec ~/ 60}:${sec % 60 >= 10 ? sec % 60 : '0${(sec % 60)}'}';
}

int getDifferenceBetweenStartAndEndDates(DateTime from, DateTime to) {
  final days = to.difference(from).inDays;
  final int years = days ~/ 365;
  final int months = (days - years * 365) ~/ 30;

  return months;
}

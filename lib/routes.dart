import 'package:bookburn/pages/book_matching_page.dart';
import 'package:bookburn/pages/profile_page.dart';
import 'package:bookburn/pages/scan_page.dart';
import 'package:bookburn/pages/start_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = { 
  StartPage.routeName: (context) => StartPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  ScanPage.routeName: (context) => ScanPage(),
  BookMatchingPage.routeName: (context) => BookMatchingPage(),
};
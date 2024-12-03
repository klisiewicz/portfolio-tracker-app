import 'package:flutter/material.dart';
import 'package:portfolio_tracker_app/src/app/theme/theme.dart';
import 'package:portfolio_tracker_app/src/holdings/view/holdings_page.dart';

class PortfolioTrackerApp extends StatelessWidget {
  const PortfolioTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Tracker App',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const HoldingsPage(),
    );
  }
}

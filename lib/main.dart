import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/app/portfolio_tracker_app.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(
    const ProviderScope(
      child: PortfolioTrackerApp(),
    ),
  );
}

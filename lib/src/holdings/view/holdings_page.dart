import 'package:flutter/material.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_error_listener.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_search_app_bar.dart';
import 'package:portfolio_tracker_app/src/holdings/view/widgets/holdings_view.dart';

class HoldingsPage extends StatelessWidget {
  const HoldingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HoldingsErrorListener(
      child: Scaffold(
        appBar: HoldingsSearchAppBar(),
        body: HoldingsView(),
      ),
    );
  }
}

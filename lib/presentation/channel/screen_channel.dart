import 'package:flutter/material.dart';

class ScreenChannel extends StatelessWidget {
  const ScreenChannel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}

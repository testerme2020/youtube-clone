import 'package:flutter/material.dart';

class Constants {
  static Widget seperatorLineH1 = Container(
    height: 1,
    width: double.infinity,
    color: Colors.white12,
  );

  static Widget seperatorLineH5 = Container(
    height: 5,
    width: double.infinity,
    color: Colors.white12,
  );

  static Widget seperatorLineH5GreyShade800 = Container(
    height: 5,
    width: double.infinity,
    color: Colors.grey.shade800,
  );

  static Widget seperatorLineH10GreyShade800 = Container(
    height: 10,
    width: double.infinity,
    color: Colors.grey.shade800,
  );

  // Empty Space
  static const Widget height10 = SizedBox(
    height: 10,
  );
  static const Widget height50 = SizedBox(
    height: 50,
  );

  static const Widget width10 = SizedBox(
    width: 10,
  );
}

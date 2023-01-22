import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube/presentation/add/screen_add.dart';
import 'package:youtube/presentation/home/screen_home.dart';
import 'package:youtube/presentation/library/screen_library.dart';
import 'package:youtube/presentation/main/widgets/bottom_navigation_bar_widget.dart';
import 'package:youtube/presentation/shorts/screen_shorts.dart';
import 'package:youtube/presentation/subscriptions/screen_subscriptions.dart';

class ScreenNavigator extends StatelessWidget {
  const ScreenNavigator({super.key});

  // Navigator
  static ValueNotifier<List<List<Widget>>> navigator = ValueNotifier([
    [const ScreenHome()],
    [const ScreenShorts()],
    [const ScreenAdd()],
    [const ScreenSubscriptions()],
    [const ScreenLibrary()],
  ]);

  static push(Widget child, {int? index}) {
    navigator.value[index ?? bottomNaviCurrentIndexNotifier.value].add(child);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    bottomNaviCurrentIndexNotifier.notifyListeners();
  }

  static pop({int? index}) {
    navigator.value[index ?? bottomNaviCurrentIndexNotifier.value].removeLast();
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    bottomNaviCurrentIndexNotifier.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navigator.value[bottomNaviCurrentIndexNotifier.value].length == 1) {
          if (bottomNaviCurrentIndexNotifier.value == 0) {
            return true;
          } else {
            bottomNaviCurrentIndexNotifier.value = 0;
            return false;
          }
        } else {
          pop();
          return false;
        }
      },
      child: ValueListenableBuilder(
          valueListenable: bottomNaviCurrentIndexNotifier,
          builder: (context, value, child) {
            return Stack(
              children: navigator.value[bottomNaviCurrentIndexNotifier.value],
            );
          }),
    );
  }
}

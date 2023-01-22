import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube/presentation/home/screen_home.dart';
import 'package:youtube/presentation/main/screen_main.dart';

final ValueNotifier bottomNaviCurrentIndexNotifier = ValueNotifier(0);

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: bottomNaviCurrentIndexNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
            backgroundColor: Theme.of(context).backgroundColor,
            currentIndex: value,
            onTap: (value) {
              if (bottomNaviCurrentIndexNotifier.value == value) {
                if (kDebugMode) {
                  navigatorKeys[value].currentState?.popUntil((route) {
                    // ignore: invalid_use_of_protected_member
                    return !route.hasActiveRouteBelow;
                  });
                }
              }
              bottomNaviCurrentIndexNotifier.value = value;
            },
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face_outlined),
                activeIcon: Icon(Icons.face),
                label: 'Shorts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                activeIcon: Icon(Icons.subscriptions),
                label: 'Subscriptions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined),
                activeIcon: Icon(Icons.video_library),
                label: 'Library',
              ),
            ],
          );
        });
  }
}

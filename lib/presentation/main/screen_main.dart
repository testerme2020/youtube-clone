import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/presentation/add/screen_add.dart';
import 'package:youtube/presentation/home/screen_home.dart';
import 'package:youtube/presentation/library/screen_library.dart';
import 'package:youtube/presentation/main/widgets/bottom_navigation_bar_widget.dart';
import 'package:youtube/presentation/shorts/screen_shorts.dart';
import 'package:youtube/presentation/subscriptions/screen_subscriptions.dart';
import 'package:youtube/presentation/video_player/miniplayer_widget.dart';

const double miniplayerMinHeight = 50;
final ValueNotifier<bool> hideMiniplayerNotifier = ValueNotifier(true);
final MiniplayerController miniplayerController = MiniplayerController();

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> screens = [
      ScreenHome(),
      ScreenShorts(),
      ScreenAdd(),
      ScreenSubscriptions(),
      ScreenLibrary(),
    ];
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: bottomNaviCurrentIndexNotifier,
              builder: (context, value, child) {
                return screens[value];
              },
            ),
            ValueListenableBuilder(
                valueListenable: hideMiniplayerNotifier,
                builder: (context, value, child) {
                  return Offstage(
                    offstage: value,
                    child: Miniplayer(
                      controller: miniplayerController,
                      minHeight: miniplayerMinHeight,
                      maxHeight: screenHeight,
                      // onDismissed: () {
                      //   // hideMiniplayerNotifier.value = true;
                      // },
                      builder: (height, percentage) {
                        return MiniplayerWidget(
                          height: height,
                          percentage: percentage,
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

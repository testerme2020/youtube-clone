import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/presentation/main/widgets/bottom_navigation_bar_widget.dart';
import 'package:youtube/presentation/main/widgets/screen_navigator.dart';
import 'package:youtube/presentation/video_player/miniplayer_widget.dart';

const double miniplayerMinHeight = 50;
final ValueNotifier<bool> hideMiniplayerNotifier = ValueNotifier(true);
final MiniplayerController miniplayerController = MiniplayerController();

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const ScreenNavigator(),
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

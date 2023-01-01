import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/presentation/home/screen_home.dart';
import 'package:youtube/presentation/video_player/miniplayer_widget.dart';
import 'package:youtube/presentation/widgets/video_list_item_widget.dart';

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
            ScrollConfiguration(
              behavior: MyBehavior(),
              child: const ScreenHome(),
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
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}

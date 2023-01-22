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

const List<Widget> screens = [
  ScreenHome(),
  ScreenShorts(),
  ScreenAdd(),
  ScreenSubscriptions(),
  ScreenLibrary(),
];

final List<GlobalKey<NavigatorState>> navigatorKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
];

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[bottomNaviCurrentIndexNotifier.value]
                .currentState!
                .maybePop();

        // Check Bottom Navigation Status
        if (bottomNaviCurrentIndexNotifier.value != 0) {
          bottomNaviCurrentIndexNotifier.value = 0;
          return false;
        }

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Stack(
                children: [
                  _buildOffstageNavigator(context, 0),
                  _buildOffstageNavigator(context, 1),
                  _buildOffstageNavigator(context, 2),
                  _buildOffstageNavigator(context, 3),
                  _buildOffstageNavigator(context, 4),
                ],
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
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return screens.elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(BuildContext context, int index) {
    var routeBuilders = _routeBuilders(context, index);

    return ValueListenableBuilder(
        valueListenable: bottomNaviCurrentIndexNotifier,
        builder: (context, currentIndex, child) {
          return Offstage(
            offstage: currentIndex != index,
            child: Navigator(
              key: navigatorKeys[index],
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) =>
                      routeBuilders[routeSettings.name]!(context),
                );
              },
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/presentation/main/screen_main.dart';
import 'package:youtube/presentation/widgets/video_list_item_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Theme.of(context).primaryColor,
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image.asset("assets/yt_logo_dark.png"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const VideoListItemsWidget();
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

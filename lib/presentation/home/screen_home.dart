import 'package:flutter/material.dart';
import 'package:youtube/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:youtube/presentation/widgets/video_list_item_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const VideoListItemsWidget();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

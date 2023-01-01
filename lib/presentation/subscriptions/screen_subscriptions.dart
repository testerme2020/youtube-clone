import 'package:flutter/material.dart';
import 'package:youtube/presentation/subscriptions/widgets/subscription_channels_bottom_list.dart';
import 'package:youtube/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:youtube/presentation/widgets/video_list_item_widget.dart';

class ScreenSubscriptions extends StatelessWidget {
  const ScreenSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: CustomScrollView(
            slivers: [
              const CustomSliverAppBar(
                bottom: SubscriptionChannelsBottomList(),
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
          ),
        ),
      ),
    );
  }
}

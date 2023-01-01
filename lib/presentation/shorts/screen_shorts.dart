import 'package:flutter/material.dart';
import 'package:youtube/presentation/shorts/widgets/shorts_channel_data_widget.dart';
import 'package:youtube/presentation/video_player/shorts_video_player.dart';
import 'package:youtube/presentation/widgets/constants.dart';
import 'package:youtube/presentation/widgets/icon_button_with_label.dart';

class ScreenShorts extends StatelessWidget {
  const ScreenShorts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            20,
            (index) {
              return Stack(
                children: [
                  // Video Player
                  const ShortsVideoPlayer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Description and channel data
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Constants.height10,
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        // Video Description
                                        Text(
                                          'Description',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        // Channel data
                                        ShortsChannelDataWidget(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Like Button
                              IconButtonWithLabel(
                                icon: Icons.thumb_up_outlined,
                                label: "Like",
                                onTap: () {},
                              ),
                              // Dislike Button
                              IconButtonWithLabel(
                                icon: Icons.thumb_down_outlined,
                                label: "Dislike",
                                onTap: () {},
                              ),

                              // comment Button
                              IconButtonWithLabel(
                                icon: Icons.comment_outlined,
                                label: "Comment",
                                onTap: () {},
                              ),

                              // Share Button
                              IconButtonWithLabel(
                                icon: Icons.share_outlined,
                                label: "Share",
                                onTap: () {},
                              ),

                              // More Button
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Icon(
                                      Icons.more_horiz_outlined,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

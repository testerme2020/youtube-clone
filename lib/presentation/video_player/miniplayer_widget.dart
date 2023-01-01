import 'package:flutter/material.dart';
import 'package:youtube/presentation/main/screen_main.dart';
import 'package:youtube/presentation/video_player/widgets/action_buttons_sections_widget.dart';
import 'package:youtube/presentation/video_player/widgets/channel_data_section_widget.dart';
import 'package:youtube/presentation/video_player/widgets/comments_data_section_widget.dart';
import 'package:youtube/presentation/video_player/widgets/title_data_section_widget.dart';
import 'package:youtube/presentation/widgets/constants.dart';
import 'package:youtube/presentation/widgets/video_list_item_widget.dart';

class MiniplayerWidget extends StatelessWidget {
  const MiniplayerWidget({
    super.key,
    required this.height,
    required this.percentage,
  });

  final double height;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    final videoPlayer = Container(
      constraints: BoxConstraints(
        maxHeight: height,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Image(
        width: height * 2.4,
        fit: BoxFit.cover,
        image: const NetworkImage(
          // "https://www.tomandjerrymovie.com/images/share.jpg"
          "https://assets.www.warnerbroscanada.com/drupal-root/public/article/media/ajax/fieldpromoimage/und/0/form-b8om7kxt2ciufdefy30bwvecg4ntjkewuhjpiifbkug/tj-blog-banner2.jpg",
        ),
      ),
    );

    return GestureDetector(
      onPanEnd: height == 50
          ? (details) {
              if (!(details.velocity.pixelsPerSecond.dy < 10) && height == 50) {
                hideMiniplayerNotifier.value = true;
              }
            }
          : null,
      child: SizedBox(
        height: miniplayerMinHeight,
        child: Column(
          children: [
            // Miniplayer Mini Widget
            MiniplayerMiniWidget(videoPlayer: videoPlayer),

            // Expanded View
            Expanded(
              child: Opacity(
                opacity: percentage,
                child: const MiniplayerExpandWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniplayerExpandWidget extends StatelessWidget {
  const MiniplayerExpandWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        // Video Title Data and views uploaded duration
        const TitleDataSectionWidget(),

        // Action Button
        const ActionButtonsSectionWidget(),

        // Line Seperator
        Constants.seperatorLineH1,

        // Channel Data
        const ChannelDataSectionWidget(),

        // Line Seperator
        Constants.seperatorLineH1,

        // Top Comment Section
        const CommentsDataSectionWidget(),

        // Related Videos List
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Constants.seperatorLineH10GreyShade800,
                  const VideoListItemsWidget(),
                ],
              );
            },
            itemCount: 20,
          ),
        )
      ],
    );
  }
}

class MiniplayerMiniWidget extends StatelessWidget {
  const MiniplayerMiniWidget({
    Key? key,
    required this.videoPlayer,
  }) : super(key: key);

  final Container videoPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        videoPlayer,
        // Video Title and Channel name
        Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Video Title
                      Text(
                        "Tom & Jerry | Tom & Jerry in Full Screen | Classic Cartoon Compilation | WB Kids",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),

                      // Channel Name
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: Text(
                          "WB Kids",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Play Button
              Flexible(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                ),
              ),

              // Close Button
              Flexible(
                child: IconButton(
                  onPressed: () {
                    hideMiniplayerNotifier.value = true;
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

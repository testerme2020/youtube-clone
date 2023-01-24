import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/presentation/channel/screen_channel.dart';
import 'package:youtube/presentation/main/screen_main.dart';

class VideoListItemsWidget extends StatelessWidget {
  const VideoListItemsWidget({
    Key? key,
    this.thumbnailUrl,
    this.title,
    this.channelIconUrl,
    this.channelTitle,
    this.views,
    this.uploadDate,
    this.onTap,
  }) : super(key: key);

  final String? thumbnailUrl;
  final String? title;
  final String? channelIconUrl;
  final String? channelTitle;
  final String? views;
  final String? uploadDate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        highlightColor: Colors.grey.shade800,
        onTap: onTap ??
            () {
              hideMiniplayerNotifier.value = false;
              miniplayerController.animateToHeight(state: PanelState.MAX);
            },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(minHeight: 200),
                color: Colors.white12,
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    thumbnailUrl ??
                        "https://assets.www.warnerbroscanada.com/drupal-root/public/article/media/ajax/fieldpromoimage/und/0/form-b8om7kxt2ciufdefy30bwvecg4ntjkewuhjpiifbkug/tj-blog-banner2.jpg",
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenChannel(),
                            ));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white12,
                        backgroundImage: channelIconUrl != null
                            ? NetworkImage(channelIconUrl!)
                            : null,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Video Title
                          Text(
                            title ??
                                "Tom & Jerry | Tom & Jerry in Full Screen | Classic Cartoon Compilation | WB Kids",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),

                          // Channel Name
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "${channelTitle ?? "WB Kids"}  •  ${views ?? "1.6M"} views  •  ${uploadDate ?? "5 years"} ago",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    splashRadius: 15,
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube/presentation/main/screen_main.dart';

class VideoListItemsWidget extends StatelessWidget {
  const VideoListItemsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        highlightColor: Colors.grey.shade800,
        onTap: () {
          hideMiniplayerNotifier.value = false;
          miniplayerController.animateToHeight(state: PanelState.MAX);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Image(
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
                image: const NetworkImage(
                  "https://assets.www.warnerbroscanada.com/drupal-root/public/article/media/ajax/fieldpromoimage/und/0/form-b8om7kxt2ciufdefy30bwvecg4ntjkewuhjpiifbkug/tj-blog-banner2.jpg",
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress?.cumulativeBytesLoaded !=
                      loadingProgress?.expectedTotalBytes) {
                    return const LinearProgressIndicator(
                      minHeight: 250,
                      color: Colors.black26,
                    );
                  } else {
                    return child;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          // Video Title
                          Text(
                            "Tom & Jerry | Tom & Jerry in Full Screen | Classic Cartoon Compilation | WB Kids",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),

                          // Channel Name
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              "WB Kids  •  1.6M views  •  5 years ago",
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

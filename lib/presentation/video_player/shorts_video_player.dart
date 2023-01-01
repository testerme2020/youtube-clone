import 'package:flutter/material.dart';

class ShortsVideoPlayer extends StatelessWidget {
  const ShortsVideoPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: const IgnorePointer(
            child: Image(
                image: NetworkImage(
                    "https://assets.www.warnerbroscanada.com/drupal-root/public/article/media/ajax/fieldpromoimage/und/0/form-b8om7kxt2ciufdefy30bwvecg4ntjkewuhjpiifbkug/tj-blog-banner2.jpg")),
          ),
        ),
      ),
    );
  }
}

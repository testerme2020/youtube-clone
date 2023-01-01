import 'package:flutter/material.dart';

class TitleDataSectionWidget extends StatelessWidget {
  const TitleDataSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // TODO: Write your action here
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
                        "1.6M views  • 5 yr ago",
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

              // Expand button
              const Icon(Icons.expand_more_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
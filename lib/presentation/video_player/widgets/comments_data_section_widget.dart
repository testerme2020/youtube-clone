import 'package:flutter/material.dart';

class CommentsDataSectionWidget extends StatelessWidget {
  const CommentsDataSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // TODO: Write your functions here
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Text(
                          "Comments",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "5M",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Expand Icon
                  const Icon(Icons.expand_more),
                ],
              ),

              // Top Comment View
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 13,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Its a most userful Video. Thank you for uploading this types of video",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
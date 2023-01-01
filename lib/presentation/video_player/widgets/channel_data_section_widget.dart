import 'package:flutter/material.dart';

class ChannelDataSectionWidget extends StatelessWidget {
  const ChannelDataSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          // TODO: Write your functions here
        },
        child: Row(
          children: [
            // Channel Icon
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 19,
              ),
            ),

            // Channel Details
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "19.2M subscribers",
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

            // Subscribe Button
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "SUBSCRIBE",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SubscriptionChannelsBottomList extends StatelessWidget
    implements PreferredSizeWidget {
  const SubscriptionChannelsBottomList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // TODO: Write your code here
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white12,
                        ),
                        SizedBox(
                          width: 60,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Center(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),

          // All Button
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 50,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).splashColor,
                    ),
                  ),
                  child: const Text(
                    "ALL",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.infinity,
        100,
      );
}

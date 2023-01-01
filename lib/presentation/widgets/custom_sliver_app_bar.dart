import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    this.bottom,
  }) : super(key: key);

  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Theme.of(context).primaryColor,
      leadingWidth: 110,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Image.asset("assets/yt_logo_dark.png"),
      ),
      actions: [
        IconButton(
          splashRadius: 25,
          onPressed: () {},
          icon: const Icon(
            Icons.cast_outlined,
            size: 22,
          ),
        ),
        IconButton(
          splashRadius: 25,
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 22,
          ),
        ),
        IconButton(
          splashRadius: 25,
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
            size: 22,
          ),
        ),
        IconButton(
          splashRadius: 25,
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white12,
            child: Icon(Icons.person),
          ),
        )
      ],
      bottom: bottom,
    );
  }
}

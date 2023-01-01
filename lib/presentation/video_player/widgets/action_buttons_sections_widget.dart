import 'package:flutter/material.dart';
import 'package:youtube/presentation/widgets/icon_button_with_label.dart';

class ActionButtonsSectionWidget extends StatelessWidget {
  const ActionButtonsSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButtonWithLabel(
            icon: Icons.thumb_up_outlined,
            label: "Like",
            onTap: () {},
          ),
          IconButtonWithLabel(
            icon: Icons.thumb_down_outlined,
            label: "Dislike",
            onTap: () {},
          ),
          IconButtonWithLabel(
            icon: Icons.share_outlined,
            label: "Share",
            onTap: () {},
          ),
          IconButtonWithLabel(
            icon: Icons.download_outlined,
            label: "Download",
            onTap: () {},
          ),
          IconButtonWithLabel(
            icon: Icons.library_add_outlined,
            label: "Save",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
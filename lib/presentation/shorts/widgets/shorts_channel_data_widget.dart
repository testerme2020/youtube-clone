import 'package:flutter/material.dart';
import 'package:youtube/presentation/widgets/constants.dart';

class ShortsChannelDataWidget extends StatelessWidget {
  const ShortsChannelDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        // Channel Icon
        CircleAvatar(
          radius: 18,
        ),
        Constants.width10,
        Text(
          'Channel Name',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}

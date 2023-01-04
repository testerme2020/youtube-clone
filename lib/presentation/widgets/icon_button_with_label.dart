import 'package:flutter/material.dart';

class IconButtonWithLabel extends StatelessWidget {
  const IconButtonWithLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconSize,
    this.labelSize,
    this.iconColor,
    this.labelColor,
    this.height,
    this.width,
  });

  final IconData icon;
  final String label;
  final Function() onTap;
  final double? iconSize;
  final double? labelSize;
  final Color? iconColor;
  final Color? labelColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: SizedBox(
          height: height ?? width ?? 75,
          width: width ?? height ?? 75,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: labelSize ?? 12,
                    color: labelColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

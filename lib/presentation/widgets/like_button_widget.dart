import 'package:flutter/material.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({
    super.key,
    this.isLiked,
    this.icon,
    this.likedIcon,
    this.label,
    this.borderRadis = 50,
    this.iconSize = 30,
    this.height,
    this.width,
  });

  final bool? isLiked;
  final IconData? icon;
  final IconData? likedIcon;
  final String? label;
  final double borderRadis;
  final double iconSize;
  final double? height;
  final double? width;

  @override
  State<LikeButtonWidget> createState() => LikeButtonWidgetState();
}

class LikeButtonWidgetState extends State<LikeButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _curve;
  late Animation<double> _sizeAnimation;
  late Animation<double> _angleAnimation;
  late Animation<Color?> _colorAnimation;

  late bool isLiked;
  late double? height;
  late double? width;

  @override
  void initState() {
    super.initState();

    // Setting isLiked State
    isLiked = widget.isLiked ?? false;

    // Setting Height and Width
    height = widget.height ?? widget.width ?? 75;
    width = widget.width ?? widget.height ?? 75;

    // Animation Controller
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: Duration.zero);

    // Animation Curve
    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);

    // Animation Size
    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: widget.iconSize,
          end: widget.iconSize + 10,
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: widget.iconSize + 10,
          end: widget.iconSize,
        ),
        weight: 1,
      ),
    ]).animate(_curve);

    // Angle Animation
    _angleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0,
          end: -0.3,
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -0.3,
          end: 0,
        ),
        weight: 1,
      ),
    ]).animate(_curve);

    // Color Animation
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.blue,
    ).animate(_curve);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(widget.borderRadis),
        onTap: () {
          setState(() {
            isLiked = !isLiked;
          });
          if (isLiked) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _angleAnimation.value,
                        child: Icon(
                          isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                          size: _sizeAnimation.value,
                          color: _colorAnimation.value,
                        ),
                      );
                    }),
                const Text("Like"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

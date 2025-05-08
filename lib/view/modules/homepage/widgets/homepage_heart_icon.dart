import 'package:alexapps/core/constants/colors.dart';
import 'package:alexapps/core/constants/images.dart';
import 'package:flutter/material.dart';


class HeartIcon extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const HeartIcon({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.8,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() {
    _controller.reverse().then((_) => _controller.forward());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _animate,
      child: ScaleTransition(
        scale: _controller,
        child: Icon(
          AppIcons.favorite,
          color: widget.isFavorite ? AppColor.customRed : AppColor.customGrey,
        ),
      ),
    );
  }
}

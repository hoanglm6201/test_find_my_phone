import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color? enableColor;
  final Color? disableColor;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    this.enableColor,
    this.disableColor,
    this.width,
    this.height,
    this.switchHeight,
    this.switchWidth,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 60),
    );
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _initializeAnimation();
      _animationController.reverse();
    }
  }


  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _circleAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.onChanged?.call(!widget.value);
          },
          child: Container(
            width: widget.width ?? 36.0,
            height: widget.height ?? 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? widget.disableColor ?? const Color(0xFF808080)
                  : widget.enableColor ?? const Color(0xFF2532C8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                alignment: _circleAnimation.value,
                child: Container(
                  width: widget.switchWidth ?? 16.0,
                  height: widget.switchHeight ?? 16.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
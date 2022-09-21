import 'package:alo_booking_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  const BouncingButton({
    Key? key,
    this.height = 50,
    this.width = double.infinity,
    this.color = AppColors.defaultColor,
    required this.child,
    this.margin,
  }) : super(key: key);

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.9)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _controller.forward().then((value) => _controller.reverse()),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          margin: widget.margin,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: widget.color,
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;

  const CustomDialogBox({
    super.key,
    required this.child ,
    required this.height,
    required this.width ,
    required this.color});

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color,
        ),
        child: widget.child,
      ),
    );
  }
}

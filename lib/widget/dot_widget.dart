import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final Color color;
  const DotWidget({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

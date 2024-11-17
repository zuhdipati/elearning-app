import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 2,
        width: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.grey,
              Colors.transparent,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}

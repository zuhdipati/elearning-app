import 'package:flutter/material.dart';

class DividerLogin extends StatelessWidget {
  const DividerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Or',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 375),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

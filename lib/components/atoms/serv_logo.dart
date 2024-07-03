import 'dart:math';

import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class ServLogo extends StatelessWidget {
  const ServLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Placeholder(
        color: black.withOpacity(0.2),
        child: Center(
          child: Transform.rotate(
            angle: pi * -45 / 180,
            child: const Text(
              'Logo',
              style: TextStyle(
                fontSize: 20,
                shadows: [
                  Shadow(
                    color: white,
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

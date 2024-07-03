import 'package:flutter/material.dart';

import '../../../../theme/text_styles.dart';

class ServText extends StatelessWidget {
  const ServText(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  factory ServText.title(String text) {
    return ServText(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600, // TODO: Doesn't work with current font
        fontSize: 20,
      ),
    );
  }

  factory ServText.error(String text) {
    return ServText(
      text,
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: defaultTextStyle.merge(style),
    );
  }
}

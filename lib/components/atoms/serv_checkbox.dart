import 'package:flutter/material.dart';

class ServCheckbox extends StatelessWidget {
  const ServCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.content,
  });

  final bool value;
  final void Function(bool value) onChanged;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          value: value,
          onChanged: (v) {
            onChanged(v ?? false);
          },
        ),
        Expanded(child: content),
      ],
    );
  }
}

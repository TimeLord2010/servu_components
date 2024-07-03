import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';
import '../../../../../theme/text_styles.dart';
import '../../buttons/serv_button.dart';

class ServTextBox extends StatefulWidget {
  const ServTextBox({
    super.key,
    this.hint,
    this.label,
    this.controller,
    this.isPassword = false,
  });

  final String? label;
  final String? hint;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<ServTextBox> createState() => _ServTextBoxState();
}

class _ServTextBoxState extends State<ServTextBox> {
  /// Used when [widget.isPassword] is true to toggle the text contents.
  bool isShown = false;

  bool get obscureText {
    if (widget.isPassword) {
      return !isShown;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = white;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: const Color.fromARGB(255, 224, 220, 220),
        ),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: defaultTextStyle.merge(const TextStyle(
            color: Color(0xFFB0B0B0),
            fontWeight: FontWeight.normal,
          )),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          //label: label != null ? ServText(label!) : null,
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //enabledBorder: InputBorder.none,
          //focusedBorder: InputBorder.none,
          border: InputBorder.none,
          //fillColor: backgroundColor,
          //filled: true,
          //isDense: true,
          suffix: getSuffix(),
        ),
      ),
    );
  }

  Widget? getSuffix() {
    if (!widget.isPassword) {
      return null;
    }
    var iconData = switch (isShown) {
      true => FluentIcons.eye_off_20_regular,
      false => FluentIcons.eye_20_regular,
    };
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: ServButton(
        onPress: () {
          setState(() {
            isShown = !isShown;
          });
        },
        child: Icon(iconData),
        // child: Image.asset(
        //   'assets/icons/eye.webp',
        //   height: 20,
        //   alignment: Alignment.centerRight,
        // ),
      ),
    );
  }
}

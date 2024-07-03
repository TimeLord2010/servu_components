import 'package:flutter/widgets.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/text_styles.dart';

class TextWithHighlight extends StatelessWidget {
  final String normal, hightlight;

  const TextWithHighlight({
    super.key,
    required this.normal,
    required this.hightlight,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: normal,
            style: defaultTextStyle.merge(const TextStyle(
              color: black,
            )),
          ),
          TextSpan(
            text: hightlight,
            style: defaultTextStyle.merge(const TextStyle(
              color: kPrimary2,
            )),
          ),
        ],
      ),
    );
  }
}

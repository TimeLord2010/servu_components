import 'package:flutter/widgets.dart';

import '../../theme/colors.dart';
import '../atoms/buttons/serv_button.dart';

class ServNavigationBar extends StatelessWidget {
  const ServNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.icons,
    required this.onTap,
  });

  final int selectedIndex;
  final List<IconData> icons;
  final void Function(int index) onTap;

  final double _height = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      width: double.infinity,
      height: _height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          for (int i = 0; i < icons.length; i++) _buildItem(i),
        ],
      ),
    );
  }

  Widget _buildItem(int i) {
    var isSelected = i == selectedIndex;
    return ServButton(
      child: TweenAnimationBuilder(
        builder: (context, value, child) {
          return Container(
            width: _height - 10,
            height: _height - 10,
            color: white,
            child: Icon(
              icons[i],
              color: value,
              size: _height / 2,
            ),
          );
        },
        duration: const Duration(milliseconds: 150),
        tween: ColorTween(
          begin: isSelected ? black : kPrimary1,
          end: isSelected ? kPrimary1 : black,
        ),
      ),
      onPress: () => onTap(i),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme/colors.dart';
import '../atoms/buttons/serv_button.dart';

class ServCarousel<T> extends StatefulWidget {
  const ServCarousel({
    super.key,
    required this.onSelect,
    required this.items,
  });

  final Iterable<ServCarouselItem> items;
  final void Function(T key) onSelect;

  @override
  State<ServCarousel<T>> createState() => _ServCarouselState<T>();
}

class _ServCarouselState<T> extends State<ServCarousel<T>> {
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            autoPlay: true,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) async {
              selectedPageIndex = index;
              setState(() {});
            },
          ),
          items: [
            for (var item in widget.items)
              ServButton(
                onPress: () => widget.onSelect(item.key),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        const Gap(10),
        Transform.scale(
          scale: 0.5,
          child: AnimatedSmoothIndicator(
            activeIndex: selectedPageIndex,
            count: widget.items.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: kPrimary2,
              dotColor: Color.fromARGB(255, 213, 213, 213),
            ),
            onDotClicked: (index) {},
          ),
        )
      ],
    );
  }
}

class ServCarouselItem<T> {
  final T key;
  final String imageUrl;

  ServCarouselItem({
    required this.key,
    required this.imageUrl,
  });
}

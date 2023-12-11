import 'dart:convert';
import 'dart:typed_data';
import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    Widget getImage(int index, List<String> items) {
      Widget imageWidget;
      try {
        String base64String = items[index];
        base64String = base64String.split("base64,")[1];
        Uint8List bytes = base64Decode(base64String);

        imageWidget = Image.memory(bytes, scale: 3);
      } catch (e) {
        imageWidget = Image.asset(MainConstants.imageDefault, scale: 3);
      }

      return imageWidget;
    }

    return Column(
      children: [
        SizedBox(
          height: height * 0.32,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return FittedBox(
                fit: BoxFit.none,
                child: getImage(index, widget.items),
              );
            },
          ),
        ),
        AnimatedSmoothIndicator(
          effect: const WormEffect(
            dotColor: Colors.white,
            activeDotColor: AppColor.darkPurple,
          ),
          count: widget.items.length,
          activeIndex: newIndex,
        )
      ],
    );
  }
}

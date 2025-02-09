import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../controller/const/const.dart';

class PoetImageSlider extends StatefulWidget {
  const PoetImageSlider({super.key});

  @override
  State<PoetImageSlider> createState() => _PoetImageSliderState();
}

class _PoetImageSliderState extends State<PoetImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height12,
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF008000),
                          Color(0xFFe9ffe4),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Poet Image $i',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        height16,
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            //    print("Rebuild");
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (i) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? Colors.green : null,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

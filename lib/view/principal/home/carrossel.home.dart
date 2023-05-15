import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carrossel extends StatefulWidget {
  @override
  _CarrosselState createState() => _CarrosselState();
}

class _CarrosselState extends State<Carrossel> {
  int _currentSlideIndex = 0;

  final List<String> images = [
    "lib/assets/carrossel1.jpg",
    "lib/assets/carrossel2.jpg",
    "lib/assets/carrossel3.jpg",
  ];

  List<Widget> get slides {
    return images.map((imagePath) {
      return Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 300,
          ),
          _buildDots(images.indexOf(imagePath)),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: CarouselSlider(
        items: slides,
        options: CarouselOptions(
          height: 300,
          autoPlay: false,
          reverse: true,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              _currentSlideIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildDots(int index) {
    return Positioned(
      bottom: 20.0, // mover as bolinhas para baixo
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: images.asMap().entries.map((entry) {
          int dotIndex = entry.key;
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotIndex == index ? Colors.white : Colors.grey,
            ),
          );
        }).toList(),
      ),
    );
  }
}

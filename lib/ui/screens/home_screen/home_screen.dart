import 'package:auto_route/auto_route.dart';
import 'package:blaa/ui/router/blaa_router.gr.dart';
import 'package:blaa/ui/screens/home_screen/widgets/slides/slide1.dart';
import 'package:blaa/ui/screens/home_screen/widgets/slides/slide2.dart';
import 'package:blaa/utils/constants/img_const.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final double _currentPage = 0.0;
  final _pageViewController = PageController();

  final List<Widget> _slides = [const Slide1(), const Slide2()];

  List<Widget> _indicator() => List<Widget>.generate(
      _slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: _currentPage.round() == index
                    ? const Color(0XFF256075)
                    : const Color(0XFF256075).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  // ------------
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: _pageViewController,
          itemCount: _slides.length,
          itemBuilder: (BuildContext context, int index) {
            return _slides[index];
          },
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 70.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _indicator(),
              ),
            ))
      ],
    );
  }
}

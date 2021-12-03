import 'package:blaa/utils/constants/img_const.dart';
import 'package:flutter/material.dart';

class Slide1 extends StatelessWidget {
  const Slide1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 50,
            //minHeight: viewportConstraints.minHeight,
            // maxHeight: viewportConstraints.minHeight
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                // fit: FlexFit.loose,
                child: Image.asset(
                  ImgConst.welcome['path']!,
                  fit: BoxFit.scaleDown,
                  // width: 80.0,
                  alignment: Alignment.topCenter,
                ),
              ),
              Expanded(
                flex: 1,
                // fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: const <Widget>[
                      Text('Let\'s start 🎉',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0XFF3F3D56),
                              height: 2.0)),
                      Text(
                        'Learn new language faster.\nUse the App to store and memorize new words.',
                        style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          'This is a learning project.\nYou can use this application for fun.',
                          style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 1.2,
                              fontSize: 16.0,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
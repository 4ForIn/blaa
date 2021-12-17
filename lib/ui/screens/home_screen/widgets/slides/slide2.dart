import 'package:blaa/utils/constants/assets_const.dart';
import 'package:flutter/material.dart';

class Slide2 extends StatelessWidget {
  const Slide2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: const Text('MEMORIZE NEW WORDS',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF3F3D56),
                          height: 2.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset(AssetsConst.bag['path']!,
                                  semanticLabel: AssetsConst.bag['description'],
                                  height: 60)),
                          const Expanded(
                              flex: 2,
                              child: Text('for work',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0XFF3F3D56),
                                      height: 2.0),
                                  textAlign: TextAlign.center))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.asset(AssetsConst.chart['path']!,
                                    semanticLabel:
                                        AssetsConst.chart['description'],
                                    height: 60)),
                            const Expanded(
                                flex: 2,
                                child: Text('up your skills',
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0XFF3F3D56),
                                        height: 2.0),
                                    textAlign: TextAlign.center))
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                  'You can use the Demo mode without creating an account.\nTo use all functionality, create own account and sign in.',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      letterSpacing: 1.2,
                                      fontSize: 16.0,
                                      height: 1.3),
                                  textAlign: TextAlign.center),
                              Text(
                                  'Go to Settings and then Sign In or Sign Up.',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      letterSpacing: 1.2,
                                      fontSize: 16.0,
                                      height: 1.3),
                                  textAlign: TextAlign.center)
                            ],
                          )),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

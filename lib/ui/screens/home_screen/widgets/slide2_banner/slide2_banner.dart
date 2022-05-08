import 'package:blaa/utils/constants/assets_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Slide2Banner extends StatelessWidget {
  const Slide2Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: const Text(
              'MEMORIZE NEW WORDS',
              style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF3F3D56),
                  height: 2.0),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Image.asset(AssetsConst.bag['path']!,
                    semanticLabel: AssetsConst.bag['description'], height: 60),
              ),
              Expanded(
                flex: 2,
                child: Text('${AppLocalizations.of(context)?.slide2ForWork}',
                    style: const TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.w300,
                        color: Color(0XFF3F3D56),
                        height: 2.0),
                    textAlign: TextAlign.center),
              ),
              const Expanded(flex: 1, child: SizedBox())
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 1,
                  child: Image.asset(AssetsConst.chart['path']!,
                      semanticLabel: AssetsConst.chart['description'],
                      height: 60),
                ),
                Expanded(
                  flex: 2,
                  child: Text('${AppLocalizations.of(context)?.slide2UpSkills}',
                      style: const TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w300,
                          color: Color(0XFF3F3D56),
                          height: 2.0),
                      textAlign: TextAlign.center),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ),
        ),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}

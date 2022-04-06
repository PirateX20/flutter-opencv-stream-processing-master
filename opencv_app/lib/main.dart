/*NOTES::
Seguindo as instruções de https://www.youtube.com/watch?v=wGH_KWpaAVM

Não usa dart.ffi para comunicação entre .dart e .cpp
aaaaaa
*/

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_opencv/native_opencv.dart';
//local import \/
import 'detection/detection_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const OpenCVApp());
}

class OpenCVApp extends StatelessWidget {
  const OpenCVApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          child: const Text('Camera'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return const DetectionPage();
            }));
          },
        ),
      ),
    );
  }
}

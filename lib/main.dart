import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:location_front/ui/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        scrollBehavior: CustomScrollBehavior(),
      home: SignUpPage(),
      title: 'Location front',
      debugShowCheckedModeBanner: false,
    );
  }
}

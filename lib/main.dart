// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:projet_de_test/screens/my_home_page.dart';
import 'package:projet_de_test/screens/page1.dart';
import 'package:projet_de_test/screens/page2.dart';
import 'package:projet_de_test/screens/page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        Page1.routeName: (context) => Page1(),
        Page2.routeName: (context) => Page2(),
        Page3.routeName: (context) => Page3()
      },
    );
  }
}

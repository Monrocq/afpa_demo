import 'package:flutter/material.dart';
import 'package:projet_de_test/widgets/globals/scaffold_custom.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: Center(child: Text("My Home Page")),
    );
  }
}

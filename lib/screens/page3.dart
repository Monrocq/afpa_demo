import 'package:flutter/material.dart';
import 'package:projet_de_test/widgets/globals/scaffold_custom.dart';

class Page3 extends StatelessWidget {
  static const String routeName = '/page3';
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
        body: Center(
      child: Text("Page3"),
    ));
  }
}

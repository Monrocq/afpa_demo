import 'package:flutter/material.dart';
import 'package:projet_de_test/widgets/globals/scaffold_custom.dart';

class Page2 extends StatelessWidget {
  static const String routeName = '/page2';
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
        body: Center(
      child: Text("Page2"),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:projet_de_test/screens/my_home_page.dart';
import 'package:projet_de_test/screens/page1.dart';
import 'package:projet_de_test/screens/page2.dart';
import 'package:projet_de_test/screens/page3.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget body;
  const ScaffoldCustom({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigation app'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2016/08/11/23/48/mountains-1587287_1280.jpg"))),
                child: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 50,
                      color: Colors.red,
                    ),
                    onPressed: () => Navigator.of(context)
                      ..pop()
                      ..pushReplacementNamed(MyHomePage.routeName)),
              ),
              ListTile(
                  title: Text("Page 1"),
                  onTap: () => Navigator.of(context)
                    ..pop()
                    ..pushReplacementNamed(Page1.routeName)),
            ],
          ),
        ),
        body: body);
  }
}

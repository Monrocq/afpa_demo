import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projet_de_test/widgets/my_custom_caroussel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  CarouselController buttonCarouselController1 = CarouselController();
  CarouselController buttonCarouselController2 = CarouselController();
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.red,
                            child: Text(
                                "${today.hour}:${today.minute.toStringAsPrecision(2)}"),
                          ),
                          Container(
                            color: Colors.green,
                            child: Text(
                              today.day.toString() +
                                  '/' +
                                  today.month.toString() +
                                  '/' +
                                  today.year.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: Colors.brown,
                        child: Text(
                          itemDetail[index]["text"]!,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                MyCustomCaroussel(
                  carouselController: buttonCarouselController1,
                ),
                MyCustomCaroussel(
                  carouselController: buttonCarouselController2,
                ),
                InkWell(
                  onTap: () {
                    if (index < 4) {
                      index++;
                    } else {
                      index = 0;
                    }
                    setState(() {
                      buttonCarouselController1.previousPage();
                      buttonCarouselController2.nextPage();
                    });
                  },
                  child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                        color: Color(0xFFAF45B1),
                      ),
                      child: Center(child: Text("Suivant"))),
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Map<String, String>> itemDetail = [
    {
      "time": "10:00",
      "date": "25/11/2021",
      "text": "Victoire au stade de France"
    },
    {
      "time": "11:00",
      "date": "26/11/2021",
      "text": "Victoire au stade de Marseille"
    },
    {
      "time": "12:00",
      "date": "27/11/2021",
      "text": "Victoire au stade de Belgique"
    },
    {
      "time": "13:00",
      "date": "29/11/2021",
      "text": "Victoire au stade de Rennes"
    },
    {
      "time": "14:00",
      "date": "10/12/2021",
      "text": "Victoire au stade de Saint-Malo"
    }
  ];
}

// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:projet_de_test/models/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nom = '';
  String email = '';

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _nomFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nom engistré : $nom"),
              Text("Email enregistré : $email"),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text("Indiquez un nom :"),
                        Flexible(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _nomController,
                            focusNode: _nomFocus,
                            onFieldSubmitted: (_) => _emailFocus.requestFocus(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text("Indiquez un email :"),
                        Flexible(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _emailController,
                            focusNode: _emailFocus,
                            onFieldSubmitted: (_) => _emailFocus.unfocus(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => setState(() {
                              nom = _nomController.text;
                              email = _emailController.text;
                            }),
                        child: Text("Enregistrer"))
                  ],
                ),
              ),
            ],
          ),
        )
        // body: ListView.builder(
        //     itemCount: myProducts.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(myProducts[index].title),
        //         subtitle: Text("Prix : ${myProducts[index].price}"),
        //       );
        //     }),
        // body: size.width > 450 ? GridView.count(
        //   crossAxisCount: size.width > 450 ? 3 : 2,
        //   children: [..._buildMyItems(), ..._buildMyItems(), ..._buildMyItems()],
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        // )
        );
  }

  // List<Product> myProducts = [
  //   Product(
  //     title: "Produit1",
  //     price: 10,
  //   ),
  //   Product(
  //       title: "Produit2",
  //       price: 10,
  //       imageUrl:
  //           "https://cdn.pixabay.com/photo/2012/06/19/10/32/owl-50267_1280.jpg"),
  //   Product(
  //     title: "Produit3",
  //     price: 10,
  //   ),
  //   Product(title: "Produit4", price: 10),
  //   Product(title: "Produit5", price: 10),
  //   Product(title: "Produit6", price: 10),
  //   Product(title: "Produit7", price: 10),
  //   Product(title: "Produit8", price: 10),
  //   Product(title: "Produit9", price: 10),
  //   Product(title: "Produit10", price: 10),
  //   Product(title: "Produit11", price: 10),
  //   Product(title: "Produit13", price: 10),
  //   Product(title: "Produit14", price: 10),
  //   Product(title: "Produit15", price: 10),
  // ];

  // List<Container> _buildMyItems() {
  //   List<Container> myList = [];
  //   for (int i = 0; i < myProducts.length; i++) {
  //     myList.add(Container(
  //       padding: const EdgeInsets.all(8),
  //       child: Column(
  //         children: [
  //           Text(myProducts[i].title),
  //           Image.network(myProducts[i].imageUrl)
  //         ],
  //       ),
  //       color: Colors.teal[100],
  //     ));
  //   }
  //   return myList;
  // }
}

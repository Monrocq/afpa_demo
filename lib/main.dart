// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projet_de_test/models/class_3_students.dart';

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
  late Future<Class3Students> futureClasse;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    futureClasse = fetchStudents();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureClasse,
          builder:
              (BuildContext context, AsyncSnapshot<Class3Students> snapshot) {
            if (snapshot.hasData) {
              return DataTable(columns: const <DataColumn>[
                DataColumn(label: Text("Designation")),
                DataColumn(label: Text("Nom élève"))
              ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  const DataCell(Text("Eleve 1")),
                  DataCell(Text(snapshot.data!.eleve1))
                ]),
                DataRow(cells: <DataCell>[
                  const DataCell(Text("Eleve 2")),
                  DataCell(Text(snapshot.data!.eleve2))
                ]),
                DataRow(cells: <DataCell>[
                  const DataCell(Text("Eleve 3")),
                  DataCell(Text(snapshot.data!.eleve3))
                ])
              ]);
            } else if (snapshot.hasError) {
              return Text("il y'a eu des erreurs : ${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            futureClasse = fetchStudents();
          });
        },
        tooltip: 'Fetch data',
        child: const Icon(Icons.download),
      ),
    );
  }

  Future<Class3Students> fetchStudents() async {
    final String url = Platform.isAndroid ? "10.0.2.2" : "localhost";
    final response = await http.get(Uri.parse('http://$url:3000/api'));
    if (response.statusCode == 200) {
      return Class3Students.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load the request http');
    }
  }
}

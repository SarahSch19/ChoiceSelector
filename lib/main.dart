import 'dart:collection';

import 'package:choice_selector/footer.dart';
import 'package:choice_selector/header.dart';
import 'package:flutter/material.dart';

import 'choice_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ItemsMap selectedItems= ItemsMap();

  final List<Item> items = [
    Item(content: "cinema"),
    Item(content: "petanque"),
    Item(content: "fitness"),
    Item(content: "LeagueOfLegends"),
    Item(content: "basket"),
    Item(content: "shopping"),
    Item(content: "programmation"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: materialTheme(),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            textDirection: TextDirection.ltr,
            children: [
              Expanded(
                flex: 2,
                child: Header(
                  selectedItems.values(),
                ),
              ),
              Expanded(
                child: Footer(
                  items,
                  itemClicked,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ThemeData materialTheme() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  void itemClicked(int itemIndex) {
    setState(() {
      String key = items[itemIndex].content;
      if (selectedItems.contains(key)) {
        selectedItems.remove(key);
      } else {
        selectedItems.add(key, items[itemIndex]);
      }
      items[itemIndex].selected = !items[itemIndex].selected;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:my_new_project/Activity/home.dart';
import 'package:my_new_project/Activity/loading.dart';
import 'package:my_new_project/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Loading(),
      "/home": (context) => const Home(),
      //"/loading": (context) => const Loading(),
      '/loading': (context) => const Loading(),
    },
  ));
}

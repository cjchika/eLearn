import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const Center(child: Text("Home")),
    const Center(child: Text("Search")),
    const Center(child: Text("Course")),
    const Center(child: Text("Chat")),
    const Center(child: Text("Profile"))
  ];

  return _widget[index];
}

import 'package:elearn_app/pages/application/widgets/application_widgets.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationPage();
}

class _ApplicationPage extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPage(0),
      )),
    );
  }
}

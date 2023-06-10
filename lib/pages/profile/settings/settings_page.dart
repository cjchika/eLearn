import 'package:elearn_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
          BlocBuilder<SettingsBlocs, SettingStates>(builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Text("Hello there"),
            ],
          ),
        );
      })),
    );
  }
}

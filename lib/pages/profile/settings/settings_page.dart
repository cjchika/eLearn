import 'package:elearn_app/common/routes/routes.dart';
import 'package:elearn_app/common/values/constant.dart';
import 'package:elearn_app/global.dart';
import 'package:elearn_app/pages/application/bloc/app_blocs.dart';
import 'package:elearn_app/pages/application/bloc/app_events.dart';
import 'package:elearn_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:elearn_app/pages/profile/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void triggerLogout(){
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGNIN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(child:
          BlocBuilder<SettingsBlocs, SettingStates>(builder: (context, state) {
        return Container(
          child: Column(
            children: [
              settingsButton(context, triggerLogout),
            ],
          ),
        );
      })),
    );
  }
}

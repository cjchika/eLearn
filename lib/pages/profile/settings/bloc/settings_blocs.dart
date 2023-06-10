import 'package:elearn_app/pages/profile/settings/bloc/settings_events.dart';
import 'package:elearn_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvent, SettingStates>{
  SettingsBlocs():super(const SettingStates()){
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvent event, Emitter<SettingStates> emit){
    emit(const SettingStates());
  }
}
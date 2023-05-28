import 'package:flutter/material.dart';
import 'package:ldt/domain/state/environment_state.dart';
import 'package:ldt/internal/app_module.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late EnvironmentState _environmentState;

  @override
  void initState() {
    super.initState();
    _environmentState = AppModule.environmentState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('main');
  }
}

import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/app/locator.dart';
import 'package:myriad_bus_scheduler/app/viewmodel/base_viewmodel.dart';
import 'package:provider/provider.dart';
import './app/mi_bus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencies();
  runApp(ChangeNotifierProvider(
    create: (_) => BaseViewModel(authUseCase: locator()),
    child: MiBus(),
  ));
}

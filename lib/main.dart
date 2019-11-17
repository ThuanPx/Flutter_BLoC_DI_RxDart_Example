import 'package:blocexample/src/di/network_module.dart';
import 'package:flutter/material.dart';
import 'src/di/bloc_injector.dart';
import 'src/di/bloc_module.dart';

void main() async {
  var container = await BlocInjector.create(BlocModule(), NetWorkModule());
  runApp(container.app);
}

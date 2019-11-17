import 'package:inject/inject.dart';
import '../app.dart';
import 'bloc_module.dart';
import 'bloc_injector.inject.dart' as g;
import 'network_module.dart';

@Injector(const [BlocModule, NetWorkModule])
abstract class BlocInjector {
  @provide
  App get app;

  static final create = g.BlocInjector$Injector.create;
}
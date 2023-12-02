import 'package:injectable/injectable.dart';
import 'package:smart_money/core/get_it/configure_dependencies.config.dart';
import 'package:smart_money/core/get_it/di_instance.dart';

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();

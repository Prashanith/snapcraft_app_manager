import 'package:get_it/get_it.dart';
import 'package:snap_ui/services/shell_manager/shell_manager.dart';

final locator = GetIt.instance;

class ServiceInitializer {
  static initializeServices() {
    locator.registerSingleton<ShellManager>(ShellManager());
  }
}

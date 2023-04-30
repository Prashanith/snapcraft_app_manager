import 'dart:io';

import '../../models/application.dart';

class ShellManager {
  Future<List<Application>> getSnapList() async {
    List<Application> snapList = [];
    var response = await Process.run('snap', ['list']);
    //print(response.stdout);
    if (response.exitCode != 0) {
      return snapList;
    }
    List<String> x = response.stdout.toString().trim().split('\n');
    x.removeAt(0);
    for (var i = 0; i < x.length; i++) {
      List<String> app = x[i].split(RegExp(r'\s+'));
      snapList.add(Application(name: app[0], version: app[1], publisher: app[4]));
    }
    return snapList;
  }

  Future<bool> uninstallApplication(String applicationName) async {
    print(applicationName);
    var response = await Process.run('sudo snap', ['remove', applicationName]);

    print(response.exitCode);
    print(response.stdout);
    if (response.exitCode == 0) {
      return true;
    }
    return false;
  }
}

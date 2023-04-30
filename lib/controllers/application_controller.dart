import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_ui/models/application.dart';
import 'package:snap_ui/services/service_initializer.dart';
import 'package:snap_ui/services/shell_manager/shell_manager.dart';

class ApplicationController extends GetxController {
  RxList<Application> appList = <Application>[].obs;

  RxString controllerError = ''.obs;

  ValueNotifier<bool> isLoading = ValueNotifier(true);

  @override
  void onInit() {
    getAppList();
    super.onInit();
  }

  var shellService = locator.get<ShellManager>();

  Future getAppList() async {
    isLoading.value = true;
    var x = await locator.get<ShellManager>().getSnapList();
    if (x.isEmpty) {
      controllerError = 'Failed to fetch applications'.obs;
    } else {
      appList.assignAll(x.obs);
    }
    isLoading.value = false;
  }

  Future uninstallApplication(int i) async {
    var x = await locator.get<ShellManager>().uninstallApplication(appList[i].name);
    if (x) {
      await getAppList();
    }
  }
}

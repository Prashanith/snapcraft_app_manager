import 'package:flutter/material.dart';
import 'package:snap_ui/controllers/application_controller.dart';
import 'package:snap_ui/controllers/controllers_mixin.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget with ControllersMixin {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(ApplicationController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Snap Manager'),
        ),
        body: ValueListenableBuilder(
          valueListenable: appController.isLoading,
          builder: (_, value, ___) => value
              ? const CircularProgressIndicator()
              : Obx(
                  () => ListView.builder(
                      itemCount: appController.appList.length,
                      itemBuilder: (_, index) => Obx(
                            () => ListTile(
                              title: Text(appController.appList[index].name),
                              trailing: ElevatedButton(
                                  onPressed: () => appController.uninstallApplication(index),
                                  child: const Icon(Icons.delete_forever_sharp)),
                            ),
                          )),
                ),
        ));
  }
}

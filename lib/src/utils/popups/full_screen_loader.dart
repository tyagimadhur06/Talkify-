import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:talkify_chat_application/src/common/common_widgets/loader/animation_loader.dart';
import 'package:talkify_chat_application/src/utils/constants/constant_colors.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    var isDark = MediaQuery.of(Get.context!).platformBrightness == Brightness.dark;
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop:  false,
              child: Container(
                color: isDark ? kContentColorLightTheme : kContentColorDarkTheme,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    AnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

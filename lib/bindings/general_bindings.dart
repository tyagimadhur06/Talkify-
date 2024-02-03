import 'package:get/get.dart';
import 'package:talkify_chat_application/src/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}
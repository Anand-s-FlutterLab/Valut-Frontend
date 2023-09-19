import 'package:get/get.dart';
import '../Controller/view_keys_controller.dart';

class ViewKeysBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ViewKeysController());
  }
}
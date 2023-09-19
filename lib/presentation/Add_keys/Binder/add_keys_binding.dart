import 'package:get/get.dart';
import '../Controller/add_keys_controller.dart';

class AddKeysBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddKeysController());
  }
}
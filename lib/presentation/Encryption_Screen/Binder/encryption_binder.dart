import 'package:get/get.dart';
import '../Controller/encryption_controller.dart';

class EncryptionBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EncryptionController());
  }
}

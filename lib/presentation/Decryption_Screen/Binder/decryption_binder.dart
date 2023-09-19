import 'package:get/get.dart';
import '../Controller/decryption_controller.dart';

class DecryptionBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DecryptionController());
  }
}
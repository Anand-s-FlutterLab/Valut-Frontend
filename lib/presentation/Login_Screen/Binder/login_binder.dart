import 'package:get/get.dart';
import '../Controller/login_controller.dart';

class LoginBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
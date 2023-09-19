import 'package:get/get.dart';
import 'package:vault/presentation/Decryption_Screen/Binder/decryption_binder.dart';
import 'package:vault/presentation/Decryption_Screen/View/decryption_screen.dart';
import 'package:vault/presentation/Encryption_Screen/View/encryption_screen.dart';
import '../presentation/Encryption_Screen/Binder/encryption_binder.dart';
import '../presentation/Home_Screen/View/home_screen.dart';
import '../presentation/Login_Screen/Binder/login_binder.dart';
import '../presentation/Login_Screen/View/login_view.dart';
import '../presentation/View_Keys/Binder/view_keys_binding.dart';
import '../presentation/View_Keys/View/view_keys.dart';
import '../presentation/Add_keys/Binder/add_keys_binding.dart';
import '../presentation/Add_keys/View/add_keys_screen.dart';
import '../splash_screen.dart';

class AppRoutes {
  static String loginScreen = '/login_screen';
  static String homeScreen = '/home_screen';
  static String splashScreen = '/splash_screen';
  static String viewKeysScreen = "/view_keys_screen";
  static String addKeysScreen = "/add_keys_screen";
  static String decryptionScreen = "/decryption_screen";
  static String encryptionScreen = "/encryption_screen";

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      bindings: [LoginBinder()],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: const [],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: const [],
    ),
    GetPage(
      name: viewKeysScreen,
      page: () => const ViewKeysScreen(),
      bindings: [ViewKeysBinder()],
    ),
    GetPage(
      name: decryptionScreen,
      page: () => const DecryptionScreen(),
      bindings: [DecryptionBinder()],
    ),
    GetPage(
      name: encryptionScreen,
      page: () => const EncryptionScreen(),
      bindings: [EncryptionBinder()],
    ),
    GetPage(
      name: addKeysScreen,
      page: () => const AddKeysScreen(),
      bindings: [AddKeysBinder()],
    ),
  ];
}

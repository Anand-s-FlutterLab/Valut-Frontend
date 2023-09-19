import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Controller/login_controller.dart';
import '../../../constants/globals.dart';
import '../../../constants/image_constants.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: height / 2.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(loginBackground), fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: height / 4.2,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(light1))),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: height / 5.7,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(light2))),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: height / 5.7,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(clock))),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: "FiraSans",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: height / 14,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade100,
                              ),
                            ),
                          ),
                          child: TextField(
                            controller: controller.usernameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height / 14,
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => TextField(
                              controller: controller.passwordController,
                              obscureText: controller.obscureText.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: Obx(
                                  () => !controller.obscureText.value
                                      ? GestureDetector(
                                          onTap: () =>
                                              controller.obscureText.value =
                                                  !controller.obscureText.value,
                                          child: Icon(
                                            Icons.visibility,
                                            color: primaryColor,
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () =>
                                              controller.obscureText.value =
                                                  !controller.obscureText.value,
                                          child: Icon(
                                            Icons.visibility_off,
                                            color: primaryColor,
                                          ),
                                        ),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.defaultDialog(
                        actions: [
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [primaryColor, primaryShading],
                              ),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                controller.setIP();
                              },
                              child: const Center(
                                child: Text(
                                  "Update",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "FiraSans",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        title: "Change IP",
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: 'Enter new IP',
                                  labelText: 'Enter new IP',
                                ),
                                controller: controller.ipController,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  hintText: 'Enter new port',
                                  labelText: 'Enter new port',
                                ),
                                controller: controller.portController,
                              )
                            ],
                          ),
                        )),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Change IP  ",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontFamily: "FiraSans",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: width - 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [primaryColor, primaryShading],
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        controller.isLoginButtonTapped.value = true;
                        controller.getData();
                      },
                      child: Center(
                        child: Obx(
                          () => controller.isLoginButtonTapped.value
                              ? LoadingAnimationWidget.prograssiveDots(
                                  color: Colors.white,
                                  size: 50,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "FiraSans",
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

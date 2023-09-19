import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/app_decoration.dart';
import '../../../constants/globals.dart';
import '../Controller/add_keys_controller.dart';

class AddKeysScreen extends GetWidget<AddKeysController> {
  const AddKeysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add Keys",
                        style: TextStyle(
                          color: primaryShading,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "FiraSans",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Add your secret keys here",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Courgette",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SizedBox(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.categoryController,
                      decoration: AppDecoration().textInputDecorationSquare(
                        "Enter Category",
                        "Enter Category",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: AppDecoration().textInputDecorationSquare(
                        "Enter Password",
                        "Enter Password",
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
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
                          controller.isSubmitTapped.value = true;
                          controller.setData();
                        },
                        child: Center(
                          child: Obx(
                                () => controller.isSubmitTapped.value
                                ? LoadingAnimationWidget
                                .prograssiveDots(
                              color: Colors.white,
                              size: 50,
                            )
                                : const Text(
                              "Submit",
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
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

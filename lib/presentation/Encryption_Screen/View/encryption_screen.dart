import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/app_decoration.dart';
import '../../../constants/globals.dart';
import '../Controller/encryption_controller.dart';

class EncryptionScreen extends GetWidget<EncryptionController> {
  const EncryptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => !controller.keyFetched.value
              ? SizedBox(
                  height: height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: primaryColor,
                          size: 50,
                        ),
                        Text(
                          "Loading...",
                          style: TextStyle(
                              color: primaryShading,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10)
                          ],
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
                                "Encryption",
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
                                "You can encrypt you personal text here",
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
                              decoration:
                                  AppDecoration().textInputDecorationSquare(
                                "Enter Title",
                                "Enter Title",
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: controller.messageController,
                              decoration:
                                  AppDecoration().textInputDecorationSquare(
                                "Enter Message",
                                "Enter Message",
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Center(
                              child: Container(
                                width: width - 30,
                                height: (height / 14),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 10),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 5),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isDense: true,
                                      menuMaxHeight: 200,
                                      borderRadius: BorderRadius.circular(10),
                                      dropdownColor: Colors.white,
                                      focusColor: Colors.white,
                                      icon: const Icon(Icons.arrow_drop_down_rounded),
                                      value: controller.selectedKey.value,
                                      items: controller.nameAndKeys.keys
                                          .map((String key) =>
                                              DropdownMenuItem<String>(
                                                value: key,
                                                child: Text(key),
                                              ))
                                          .toList(),
                                      onChanged: (String? selectedKey) {
                                        controller.selectedKey.value =
                                            selectedKey!;
                                        controller.selectedPassword.value =
                                            controller.nameAndKeys[selectedKey];
                                      },
                                      hint: const Text('Select a value'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
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
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

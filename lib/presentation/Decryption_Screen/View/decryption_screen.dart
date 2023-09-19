import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Controller/decryption_controller.dart';
import 'package:vault/constants/image_constants.dart';

import '../../../constants/globals.dart';

class DecryptionScreen extends GetWidget<DecryptionController> {
  const DecryptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                "Decryption",
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
                                "See your encrypted data here",
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
                          Center(
                            child: Container(
                              width: width - 30,
                              height: (height / 14),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 10),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 5),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(15),
                                    dropdownColor: Colors.white,
                                    focusColor: Colors.white,
                                    icon: const Icon(
                                        Icons.arrow_drop_down_rounded),
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
                                      controller.getData(
                                          controller.nameAndKeys[selectedKey]!);
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => !controller.dataFetched.value
                          ? SizedBox(
                              height: height - 247,
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
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : (controller.nameAndData.isNotEmpty &&
                                  controller.dataFetched.value)
                              ? SingleChildScrollView(
                                  child: SizedBox(
                                    height: height - 247,
                                    child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: controller.nameAndData.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 10,
                                                  spreadRadius: 4)
                                            ],
                                          ),
                                          child: ListTile(
                                            title: Text(controller
                                                .nameAndData.keys
                                                .elementAt(index)),
                                            subtitle: Text(controller
                                                .nameAndData.entries
                                                .elementAt(index)
                                                .value),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: 35,
                                                  width: 30,
                                                  child: GestureDetector(
                                                      onTap: () async {
                                                        await Clipboard.setData(
                                                          ClipboardData(
                                                            text: controller
                                                                .nameAndKeys
                                                                .entries
                                                                .elementAt(
                                                                    index)
                                                                .value,
                                                          ),
                                                        );
                                                      },
                                                      child: Image(
                                                        color: primaryColor,
                                                        image: AssetImage(
                                                          copy,
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                  width: 30,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Get.defaultDialog(
                                                            title: "Delete",
                                                            content: Column(
                                                              children: [
                                                                Text(
                                                                  "Are you sure want to delete ${controller.nameAndData.keys.elementAt(index)}",
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    MaterialButton(
                                                                      shape: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              12),
                                                                          borderSide:
                                                                              BorderSide.none),
                                                                      color: Colors
                                                                          .blue,
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "Cancle",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    MaterialButton(
                                                                      shape: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              12),
                                                                          borderSide:
                                                                              BorderSide.none),
                                                                      color: Colors
                                                                          .red,
                                                                      onPressed:
                                                                          () {
                                                                        controller.deleteData(controller
                                                                            .nameAndData
                                                                            .keys
                                                                            .elementAt(index));
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "Delete",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ));
                                                      },
                                                      child: Image(
                                                        color: Colors.red,
                                                        fit: BoxFit.fitHeight,
                                                        image: AssetImage(
                                                          delete2,
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          height: 15,
                                        );
                                      },
                                    ),
                                  ),
                                )
                              : Center(
                                  child: SizedBox(
                                    height: height - 247,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(noResultFound),
                                        ),
                                        Text(
                                          "Nothing To Show",
                                          style: TextStyle(
                                            color: primaryShading,
                                            fontFamily: "FiraSans",
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

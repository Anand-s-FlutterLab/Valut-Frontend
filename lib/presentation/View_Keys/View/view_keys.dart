import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vault/constants/globals.dart';
import 'package:vault/constants/image_constants.dart';
import '../Controller/view_keys_controller.dart';
import 'package:flutter/services.dart';

class ViewKeysScreen extends GetWidget<ViewKeysController> {
  const ViewKeysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => !controller.dataFetched.value
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
                        width: width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 10)
                            ],
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
                                  "Keys",
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
                                  "See all keys here",
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
                              height: 30,
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
                          height: height - 200,
                          child: ListView.separated(
                              itemBuilder: (context, index) => Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 10,
                                            spreadRadius: 4)
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(controller.nameAndKeys.keys
                                          .elementAt(index)),
                                      subtitle: Text(controller
                                          .nameAndKeys.entries
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
                                                          .nameAndKeys.entries
                                                          .elementAt(index)
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
                                            height: 35,
                                            width: 30,
                                            child: GestureDetector(
                                                onTap: () {
                                                  Get.defaultDialog(
                                                      title: "Delete",
                                                      content: Column(
                                                        children: [
                                                          Text(
                                                            "Are you sure want to delete ${controller.nameAndKeys.keys.elementAt(index)}",
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
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none),
                                                                color:
                                                                    Colors.blue,
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Cancle",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none),
                                                                color:
                                                                    Colors.red,
                                                                onPressed: () {
                                                                  controller.deleteData(controller
                                                                      .nameAndKeys
                                                                      .keys
                                                                      .elementAt(
                                                                          index));
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Delete",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ));
                                                },
                                                child: Icon(
                                                  Icons.delete_forever,
                                                  size: 33,
                                                  color: Colors.red.shade500,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 15,
                                  ),
                              itemCount: controller.nameAndKeys.length),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

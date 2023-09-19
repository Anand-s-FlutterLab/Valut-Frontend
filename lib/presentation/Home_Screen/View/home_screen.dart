import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vault/constants/globals.dart';
import 'package:vault/constants/image_constants.dart';
import 'package:vault/routes/app_routes.dart';

class HomeScreen extends GetWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding:
                    EdgeInsets.fromLTRB(width / 17, width / 20, 0, width / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vault',
                      style: TextStyle(
                        fontFamily: "FiraSans",
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: width / 35,
                    ),
                    Text(
                      "Welcome Back, $userName",
                      style: TextStyle(
                          fontSize: 19,
                          fontFamily: "FiraSans",
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              homePageCardsGroup(
                const Color(0xff63ace5),
                encryption,
                'Encrypt',
                context,
                AppRoutes.encryptionScreen,
                const Color(0xffFF6D6D),
                decryption,
                'Decrypt',
                AppRoutes.decryptionScreen,
              ),
              homePageCardsGroup(
                Colors.lightGreen,
                addKeys,
                'Add Keys',
                context,
                AppRoutes.addKeysScreen,
                const Color(0xffffa700),
                viewKeys,
                'View Keys',
                AppRoutes.viewKeysScreen,
              ),
              SizedBox(height: width / 20),
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, width / 7, width / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Get.defaultDialog(
                        title: "Logout",
                        content: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Are you sure you want to log out?",
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  color: Colors.blue,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "Cancle",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  color: Colors.red,
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.loginScreen);
                                  },
                                  child: const Text(
                                    "logout",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: width / 8.5,
                        width: width / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.logout_outlined,
                          size: 25,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget homePageCardsGroup(
      Color color,
      String icon,
      String title,
      BuildContext context,
      String route,
      Color color2,
      String icon2,
      String title2,
      String route2) {
    return Padding(
      padding: EdgeInsets.only(bottom: width / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context, route),
          homePageCard(color2, icon2, title2, context, route2),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, String icon, String title,
      BuildContext context, String route) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Get.toNamed(route);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: w / 2,
        width: w / 2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff040039).withOpacity(.15),
              blurRadius: 99,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: w / 7,
                width: w / 7,
                decoration: BoxDecoration(
                  color: color.withOpacity(.1),
                  shape: BoxShape.circle,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: width / 12,
                    width: width / 12,
                    child: Image.asset(
                      icon,
                      color: color.withOpacity(.6),
                    ),
                  ),
                )),
            Text(
              title,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "FiraSans",
                fontSize: 18,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

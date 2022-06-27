import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/idVerification/idverification_screen.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(Get.width * 0.02669),
              decoration: BoxDecoration(
                  color: ColorRes.color_4F359B,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 16.72,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(Strings.termsConditions,
                        style: textStyleFont30WhiteExtraBold,
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: Get.height * 0.042,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SizedBox(
                      width: Get.width * 1,
                      height: Get.height * 0.058,
                      child: Text(Strings.privacyPolicy,
                          style: textStyleFont16Whit,
                          textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: Get.height * 0.60,
                      width: Get.width * 0.85,
                      child: Text(
                        Strings.agreementTerms,
                        style: textStyleFont16Whit,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const IdVerificationScreen());
                      },
                      child: Container(
                        width: Get.width * 0.84,
                        height: Get.height * 0.073,
                        decoration: BoxDecoration(
                            color: ColorRes.color_E7D01F,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          Strings.accCon,
                          style: textStyleFont16BlackLight,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.063,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

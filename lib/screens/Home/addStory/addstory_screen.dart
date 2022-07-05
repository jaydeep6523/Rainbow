import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/Widget/text_styles.dart';
import 'package:rainbow/screens/Home/addStory/add_controller.dart';
import 'package:rainbow/utils/asset_res.dart';
import 'package:rainbow/utils/color_res.dart';
import 'package:rainbow/utils/strings.dart';

class AddStoryScreen extends StatelessWidget {
   AddStoryScreen({Key? key}) : super(key: key);
  AddStoryController controller = Get.put(AddStoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions:  [
       Row(
         children: [
           GestureDetector(onTap: () {
             Get.back();
           },
             child:Image.asset(AssetRes.backIcon,height: 16,width: 16,color:ColorRes.color_252525 ,),
           ),
           SizedBox(width: Get.width * 0.8,),
           GestureDetector(onTap: () {
             Get.back();
           },
               child: Text(Strings.post,style: textStyleFont13Bold,)),
           SizedBox(width: Get.width * 0.05,),

         ],
       )
        ],
      ),
      body: Column(
        children:  [
          SizedBox(height: Get.height * 0.02,),
            Row(
              children: [
                SizedBox(width: Get.width*0.05,),

                Container(height: 40,width: 40,
                    decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage(AssetRes.se_profile))
                ),
                 ),
                SizedBox(width: Get.width*0.05,),
                SizedBox(width: Get.width*0.5,
                  child: TextField(
                    controller: controller.writeSomethings,
                    obscureText: false,
                    style: textFieldText,
                    minLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 6),
                      border: InputBorder.none,
                      hintStyle: textStyleFont16Grey,
                      hintText: Strings.writeSomethings,
                      /*   filled: true,
                        fillColor: ColorRes.color_9597A1.withOpacity(0.1)*/
                    ),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}

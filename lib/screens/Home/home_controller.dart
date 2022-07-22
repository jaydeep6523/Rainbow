import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rainbow/common/blocList_api/blockList_api.dart';
import 'package:rainbow/common/helper.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/blockList_model.dart';
import 'package:rainbow/model/listOfFriendRequest_model.dart';
import 'package:rainbow/screens/Home/Story/story_controller.dart';
import 'package:rainbow/screens/Home/addStroy/addStory_screen.dart';
import 'package:rainbow/screens/Home/my_story/my_story_controller.dart';
import 'package:rainbow/screens/Home/my_story/my_story_screen.dart';
import 'package:rainbow/screens/Home/view_story/view_story_controller.dart';
import 'package:rainbow/screens/Profile/profile_controller.dart';
import 'package:rainbow/screens/Profile/widget/listOfFriendRequest_api/listOfFriendRequest_api.dart';
import 'package:rainbow/screens/auth/register/list_nationalites/list_nationalites_api.dart';
import 'package:rainbow/screens/auth/registerfor_adviser/listOfCountry/listOfCountryApi.dart';
import 'package:rainbow/screens/notification/notification_screen.dart';

class HomeController extends GetxController {
  RxBool loader = false.obs;
  ProfileController controller = Get.put(ProfileController());
  ListOfFriendRequestModel listOfFriendRequestModel =
      ListOfFriendRequestModel();
  ViewStoryController viewStoryController = Get.put(ViewStoryController());
  List<bool> isAd = List.generate(10, (index) => Random().nextInt(2) == 1);
  MyStoryController myStoryController = Get.put(MyStoryController());
  RefreshController? refreshController;

  @override
  Future<void> onInit() async {
    init();
    super.onInit();
  }

  final storyController = EditStoryController();

  Future<void> countryName() async {
    try {
      await ListOfCountryApi.postRegister()
          .then((value) => listCountryModel = value!);
      debugPrint(listCountryModel.toJson().toString());
      getCountry();
    } catch (e) {
      errorToast(e.toString());
      debugPrint(e.toString());
    }
  }

  void onNewStoryTap() {
    // if (myStoryController.myStoryModel.data!.isNotEmpty) {
    Get.to(() => const MyStoryScreen())!.whenComplete(() {
      init();
    });
    /*   } else {
      Get.to(() => AddStoryScreen());
    }*/
    // Get.to(() => AddStoryScreen());
  }

  Future<void> countryNationalites() async {
    try {
      await ListOfNationalitiesApi.postRegister()
          .then((value) => listNationalities = value!);
      print(listNationalities);
      getCountryNation();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  BlockListModel blockListModel = BlockListModel();

  Future<void> blockListDetailes() async {
    try {
      await BlockListApi.postRegister()
          .then((value) => blockListModel = value!);
      print(blockListModel);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> listOfFriedRequestDetails() async {
    try {
      changeLoader(true);
      listOfFriendRequestModel = (await ListOfFriendRequestApi.postRegister())!;
      update(["connections"]);
      changeLoader(false);
    } catch (e) {
      changeLoader(false);
    }
  }

  Future<void> init() async {
    changeLoader(true);
    countryName();
    countryNationalites();
    // await blockListDetailes();
    // await listOfFriedRequestDetails();
    await viewStoryController.friendStoryApiData();
    await controller.viewProfileDetails();
    await myStoryController.init();
    changeLoader(false);
    // viewStoryController.friendStoryApiData();
    // loader.value = true;
  }

  Future<void> myStoryOnTap() async {
    Get.to(() => AddStoryScreen());
    /*MyStoryController myStoryController = Get.put(MyStoryController());
    loader.value = true;
    await myStoryController.init();
    loader.value = false;
    if (myStoryController.myStoryModel.data!.isNotEmpty) {
      Get.to(() => const MyStoryScreen());
    } else {
      Get.to(() => AddStoryScreen());
    }*/
  }

  Future<void> onRefresh() async {
    await init();
    refreshController!.refreshCompleted();
  }

  void changeLoader(bool status) {
    if(refreshController == null || refreshController!.headerMode == null){
      loader.value = status;
      return;
    }
    if (refreshController!.headerMode!.value == RefreshStatus.refreshing) {
      return;
    }
    loader.value = status;
  }

  void onNotyIconBtnTap(){
    Get.to(() => NotificationScreen());
  }
}

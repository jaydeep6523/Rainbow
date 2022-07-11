import 'package:get/get.dart';
import 'package:rainbow/screens/Profile/profile_api/profile_api.dart';
import 'package:rainbow/screens/Profile/profile_api/profile_model.dart';
import 'package:rainbow/utils/asset_res.dart';

class ProfileController extends GetxController
{
  RxBool loader = false.obs;
  bool seeMoreAndLess = false;
  List<String> image = [AssetRes.lt1,AssetRes.lt2,AssetRes.lt3,AssetRes.se,AssetRes.homePro,AssetRes.lt1,];
  List<String> imageName = ["Amber Davis","Lyka Keen","Liz Mcguire","Riku Tanida","Natalie Nara ","Sally Wilson",];
  ViewProfile viewProfile = ViewProfile();


  @override
  void onInit()
  {
    init();
    viewProfileDetails();
    super.onInit();
  }
  Future<void> init() async {
    loader.value = true;

  }
  void onShowMoreTap(bool value) {
    seeMoreAndLess = value;
  }

  Future<void> viewProfileDetails() async {
    try {
      loader.value = true;
      await ViewProfileApi.postRegister()
          .then((value) => viewProfile = value);
      // await PrefService.setValue(PrefKeys.registerToken, registerUser.token.toString());

      loader.value = false;
    } catch (e) {
      loader.value = false;
    }

  }

}
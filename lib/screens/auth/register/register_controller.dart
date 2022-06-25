import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:rainbow/common/popup.dart';
import 'package:rainbow/helper.dart';
import 'package:rainbow/screens/getstarted_screen.dart';
import 'package:rainbow/utils/strings.dart';

class RegisterController extends GetxController {
  void init() {}
  DateTime selectedDate = DateTime.now();

  TextEditingController fullNameController = TextEditingController(/*text: "ravi"*/);
  TextEditingController emailController = TextEditingController(/*text: "ravi@gmail.com"*/);
  TextEditingController pwdController = TextEditingController(/*text: "123456"*/);
  TextEditingController confirmPwdController = TextEditingController(/*text: "123456"*/);
  TextEditingController address1Controller = TextEditingController(/*text: "csasdd"*/);
  TextEditingController address2Controller = TextEditingController(text: "dfdfwdfdw");
  TextEditingController phoneController = TextEditingController(text: "7878787878");
  TextEditingController statusController = TextEditingController(text: "single");
  TextEditingController ethnicityController = TextEditingController(text: "single");
  TextEditingController dobController = TextEditingController(text: "07-06-1999");
  TextEditingController kidsController = TextEditingController(text: "1");

  List<String> martialStatusList = [
    Strings.single,
    Strings.married,
  ];
  List<String> ethnicityList = [
    Strings.single,
    Strings.married,
  ];  List<String> noOfKids = [
    "0","1","2","3","4","5","6"
  ];
  bool martialStatusDropdown = false;
  bool ethnicityDropdown = false;
  bool kidsDropdown = false;

  Country countryModel = Country.from(json: {
    "e164_cc": "1",
    "iso2_cc": "CA",
    "e164_sc": 0,
    "geographic": true,
    "level": 2,
    "name": "Canada",
    "example": "2042345678",
    "display_name": "Canada (CA) [+1]",
    "full_example_with_plus_sign": "+12042345678",
    "display_name_no_e164_cc": "Canada (CA)",
    "e164_key": "1-CA-0"
  });

  void onCountryTap(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        countryModel = country;
        update(['phone_filed']);
      },
    );
  }

  void onStatusSelect() {
    // martialStatusDropdown = true;
    if(martialStatusDropdown == false)
      {
        martialStatusDropdown=true;
      }
    else
      {
        martialStatusDropdown=false;
      }

    update(['register_screen']);
  }

  void onStatusChange(String value) {
    statusController.text = value;
    update(['register_screen']);
  }

  void onEthnicitySelect() {
    if(ethnicityDropdown == false)
    {
      ethnicityDropdown=true;
    }
    else
    {
      ethnicityDropdown=false;
    }
    update(['register_screen']);
  }

  void onEthnicityChange(String value) {
    ethnicityController.text = value;
    update(['register_screen']);
  }

  void onBODSelect() {}

  void onKidsSelect() {
    // kidsDropdown = true;
    if(kidsDropdown == false)
    {
      kidsDropdown=true;
    }
    else
    {
      kidsDropdown=false;
    }
    update(['register_screen']);
  }

  void onKidsChange(String value) {
    kidsController.text = value;
    update(['register_screen']);
  }

  void onAddress1Change(String str) {
    if (str.length > 440 && str.length < 460) {
      update(['address1']);
    }
  }

  void onAddress2Change(String str) {
    if (str.length > 440 && str.length < 460) {
      update(['address2']);
    }
  }

  void onRegisterTap() {
    if (validation()) {
      Get.to(()=>GetStartedScreens());
    }
  }

  void onSignInTap() {}

  bool validation() {
    if (fullNameController.text.isEmpty) {
      errorToast(Strings.fullNameError);
      return false;
    } else if (emailController.text.isEmpty) {
      errorToast(Strings.emailError);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      errorToast(Strings.emailValidError);
      return false;
    } else if (pwdController.text.isEmpty) {
      errorToast(Strings.passwordError);
      return false;
    } else if (validatePassword(pwdController.text)) {
      errorToast(Strings.passwordValidError);
      return false;
    } else if (confirmPwdController.text.isEmpty) {
      errorToast(Strings.reTypePasswordError);
      return false;
    } else if (pwdController.text != confirmPwdController.text) {
      errorToast(Strings.reTypePasswordValidError);
      return false;
    } else if (address1Controller.text.isEmpty) {
      errorToast(Strings.addressLine1Error);
      return false;
    } else if (phoneController.text.isEmpty) {
      errorToast(Strings.phoneNumberError);
      return false;
    } else if (!GetUtils.isPhoneNumber(phoneController.text)) {
      errorToast(Strings.phoneNumberValidError);
      return false;
    } else if (statusController.text.isEmpty) {
      errorToast(Strings.maritalStatusError);
      return false;
    } else if (ethnicityController.text.isEmpty) {
      errorToast(Strings.ethnicityError);
      return false;
    } else if (dobController.text.isEmpty) {
      errorToast(Strings.birthDateError);
      return false;
    } else if (kidsController.text.isEmpty) {
      errorToast(Strings.noOfKidsError);
      return false;
    }
    return true;
  }


String? bDateStore;
  Future<void> selectDate(BuildContext context) async {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1970, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          print('confirm $date');
          var formattedDate = "${date.day}-${date.month}-${date.year}";
          dobController.text = formattedDate;
        }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

}

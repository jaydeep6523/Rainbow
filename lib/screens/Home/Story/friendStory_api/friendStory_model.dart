
import 'dart:convert';

import 'package:rainbow/common/popup.dart';
import 'package:rainbow/model/friendStroy_model.dart';
import 'package:rainbow/service/http_services.dart';
import 'package:rainbow/service/pref_services.dart';
import 'package:rainbow/utils/end_points.dart';
import 'package:rainbow/utils/pref_keys.dart';
import 'package:http/http.dart' as http;

class FriendStoryApi {
  static Future postRegister() async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    // int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.friendStory;

      /*    Map<String, dynamic> param = {
        "id_item": idItem,
        "description": description,
        "tag": list
      };*/

      http.Response? response = await HttpService.getApi(
          url: url,
          header: {
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];
        if (status == false) {
          flutterToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          // flutterToast( jsonDecode(response.body)["message"]);

        }
        return friendStoryModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

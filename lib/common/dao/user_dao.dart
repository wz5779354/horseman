import 'dart:convert';

import 'package:flutter_horseman/common/config/config.dart';
import 'package:flutter_horseman/common/dao/dao_result.dart';
import 'package:flutter_horseman/common/local/local_storage.dart';
import 'package:flutter_horseman/common/model/User.dart';
import 'package:flutter_horseman/common/redux/user_redux.dart';
import 'package:flutter_horseman/common/utils/common_utils.dart';
import 'package:redux/redux.dart';

class UserDao {

  ///初始化用户信息

  static initUserInfo(Store store) async {
    var token = await LocalStorage.get(Config.TOKEN_KEY);
    var res = await getUserInfoLocal();
    if(res != null && res.result && token != null){
      store.dispatch(UpdateUserAction(res.data));
    }


    ///切换语言
    String localeIndex = await LocalStorage.get(Config.LOCALE);
    if (localeIndex != null && localeIndex.length != 0) {
      CommonUtils.changeLocale(store, int.parse(localeIndex));
    }

    return new DataResult(res.data, (res.result && (token != null)));
  }

  ///获取本地登录用户信息
  static getUserInfoLocal() async {
    var userText = await LocalStorage.get(Config.USER_INFO);
    if (userText != null) {
      var userMap = json.decode(userText);
//      User user = User.fromJson(userMap);
//      return new DataResult(user, true);
      return new DataResult(null, false);
    } else {
      return new DataResult(null, false);
    }
  }
}

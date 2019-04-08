
import 'package:flutter/material.dart';
import 'package:flutter_horseman/common/model/User.dart';

/**
 * Redux全局State
 * Created by wangze
 * Date: 2019-04-08
 */

class HSManState{

  //用户信息
  User userInfo;

  //语言
  Locale local;

  //当前手机平台默认语言
  Locale platformLocale;

  HSManState(this.userInfo, this.local);


}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store


HSManState appReducer(HSManState state,action){


}
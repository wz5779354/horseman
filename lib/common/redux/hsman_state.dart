import 'package:flutter/material.dart';
import 'package:flutter_horseman/common/model/User.dart';
import 'package:flutter_horseman/common/redux/locale_redux.dart';
import 'package:flutter_horseman/common/redux/user_redux.dart';

/**
 * Redux全局State
 * Created by wangze
 * Date: 2019-04-08
 */

class HSManState {
  //用户信息
  User userInfo;

  //语言
  Locale locale;

  //当前手机平台默认语言
  Locale platformLocale;

  HSManState({this.userInfo, this.locale});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store

HSManState appReducer(HSManState state, action) {
  return HSManState(
    ///通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
    ///通过 LocaleReducer 将 GSYState 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),
  );
}
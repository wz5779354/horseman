import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_horseman/common/event/http_error_event.dart';
import 'package:flutter_horseman/common/localization/hsman_localizations_delegate.dart';
import 'package:flutter_horseman/page/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_horseman/common/model/User.dart';
import 'package:flutter_horseman/common/net/code.dart';
import 'package:flutter_horseman/common/redux/hsman_state.dart';
import 'package:flutter_horseman/common/utils/common_utils.dart';
import 'package:flutter_horseman/page/welcome_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
    FlutterReduxApp());

class FlutterReduxApp extends StatelessWidget {
  ///创建 store， 引用HSManState 中的appReducer 实现 Reducer 方法
  /// initialState  初始化 State
  final store = new Store<HSManState>(
    appReducer,

    ///初始化数据
    initialState:
        new HSManState(userInfo: User.empty(), locale: Locale('zh', 'CH')),
  );

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 通过 StoreProvider 应用 store
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<HSManState>(builder: (context, store) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          ///多语言实现代理
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            HSManLocalizationsDelegate.delegate,
          ],
          locale: store.state.locale,
          supportedLocales: [store.state.locale],
          routes: {
            WelcomePage.sName: (context) {
              store.state.platformLocale = Localizations.localeOf(context);
              return WelcomePage();
            },
            HomePage.sName:(context){
              return HSManLocalizations(
                child: new HomePage(),
              );
            },
/*            LoginPage.sName:(context){
              return HSManLocalizations(
                child: new LoginPage(),
              );
            },*/
          },
        );
      }),
    );
  }
}

class HSManLocalizations extends StatefulWidget {
  final Widget child;

  HSManLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _HSManLocalizations();
  }
}

class _HSManLocalizations extends State<HSManLocalizations> {
  StreamSubscription stream;

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<HSManState>(builder: (context, store) {
      ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }
  @override
   void dispose(){
    super.dispose();
    if(stream != null){
      stream.cancel();
      stream = null;
    }
  }

  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error);
        break;
      case 401:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_401);
        break;
      case 403:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_403);
        break;
      case 404:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_404);
        break;
      case Code.NETWORK_TIMEOUT:
        //超时
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_timeout);
        break;
      default:
        Fluttertoast.showToast(
            msg: CommonUtils.getLocale(context).network_error_unknown +
                " " +
                message);
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_horseman/common/dao/user_dao.dart';
import 'package:flutter_horseman/common/localization/default_localizations.dart';
import 'package:flutter_horseman/common/redux/hsman_state.dart';
import 'package:flutter_horseman/common/style/hsman_style.dart';
import 'package:flutter_horseman/common/utils/common_utils.dart';
import 'package:flutter_horseman/common/utils/navigator_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = '/';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<HSManState> store = StoreProvider.of(context);
    CommonUtils.initStatusBarHeight(context);
    new Future.delayed(const Duration(seconds: 2), () {
/*     UserDao.initUserInfo(store).then((res){
       if(res != null && res.result){
         NavigatorUtils.goHome(context);
       }else{
         NavigatorUtils.goLogin(context);
       }

       return true;
     });*/
      NavigatorUtils.goHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreBuilder<HSManState>(
      builder: (context,store){
        return new Container(
          color: Color(HSManColors.white),
          child: new Center(
           child: Stack(
              children: <Widget>[
                //加载页面居中背景图 使用cover模式
                new Text(HSManLocalizations.of(context).currentLocalized.language),
                Image.asset("static/images/2x/welcome.png",fit: BoxFit.cover,),
//                Image.asset("static/images/2x/loading.jpeg",fit: BoxFit.cover,),
              ],
            ),

          ),
        );
      },
    );
/*
    return new Container(
      color: Color(HSManColors.white),
      child: new Center(
        child: Stack(
          children: <Widget>[
            //加载页面居中背景图 使用cover模式
            Image.asset(
              "static/images/2x/welcome.png",
              fit: BoxFit.cover,
            ),
//                Image.asset("static/images/2x/loading.jpeg",fit: BoxFit.cover,),
          ],
        ),
      ),
    );*/
  }
}

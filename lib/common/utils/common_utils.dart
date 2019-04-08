import 'dart:ui';

import 'package:flutter_horseman/common/redux/locale_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_horseman/common/redux/hsman_state.dart';

class CommonUtils {



  static changeLocal(Store<HSManState> store,int index){
    Locale locale = store.state.platformLocale;
    switch(index){
      case 1:
        locale = Locale('zh','CH');
        break;
      case 2:
        locale =Locale('en','US');
        break;

    }

    store.dispatch(RefreshLocaleAction(locale));
  }
}

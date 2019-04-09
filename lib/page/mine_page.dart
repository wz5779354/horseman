import 'package:flutter/material.dart';
import 'package:flutter_horseman/common/config/config.dart';
import 'package:flutter_horseman/common/local/local_storage.dart';
import 'package:flutter_horseman/common/redux/hsman_state.dart';
import 'package:flutter_horseman/common/utils/common_utils.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showLanguageDialog(BuildContext context, Store store) {
      List<String> list = [
        CommonUtils.getLocale(context).home_language_default,
        CommonUtils.getLocale(context).home_language_zh,
        CommonUtils.getLocale(context).home_language_en,
      ];
      CommonUtils.showCommitOptionDialog(context, list, (index) {
        CommonUtils.changeLocale(store, index);
        LocalStorage.save(Config.LOCALE, index.toString());
      }, height: 150.0);
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('我的页面'),
      ),
      body: new StoreBuilder<HSManState>(
        builder: (context, store) {
          return new Center(
            child: new Column(
              children: <Widget>[
                Text('我的页面'),
                new RaisedButton(
                  onPressed: () {
                    showLanguageDialog(context, store);
                  },
                  child: new Text(CommonUtils.getLocale(context).language),
                )
              ],
            ),

//        child: Text('我的页面'),
          );
        },
      ),
/*      body: new Center(
        child: new Column(
          children: <Widget>[
            Text('我的页面'),
            new RaisedButton(onPressed: (){
              showLanguageDialog(context);
            },
            child: new Text(CommonUtils.getLocale(context).language),)
          ],
        ),

//        child: Text('我的页面'),
      ),*/
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_horseman/common/localization/default_localizations.dart';

class HSManLocalizationsDelegate
    extends LocalizationsDelegate<HSManLocalizations> {

  HSManLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
   /// 支持中文和英文
    return ['en','zh'].contains(locale.languageCode);
  }

  /// 根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<HSManLocalizations> load(Locale locale) {

    return new SynchronousFuture<HSManLocalizations>(new HSManLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<HSManLocalizations> old) {

    return false;
  }

  ///全局静态的代理
  static HSManLocalizationsDelegate delegate = new HSManLocalizationsDelegate();
}

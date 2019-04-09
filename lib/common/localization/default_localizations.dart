
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_horseman/common/style/hsman_string_base.dart';
import 'package:flutter_horseman/common/style/hsman_string_en.dart';
import 'package:flutter_horseman/common/style/hsman_string_zh.dart';

///自定义多语言实现
class HSManLocalizations {
  final Locale locale;

  HSManLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///HSManStringEn和HSManStringZh都继承了HSManStringBase
  static Map<String, HSManStringBase> _localizedValues = {
    'en': new HSManStringEn(),
    'zh': new HSManStringZh(),
  };
  HSManStringBase get currentLocalized{
    return _localizedValues[locale.languageCode];
  }

///通过 Localizations 加载当前的 HSManLocalizations
///获取对应的 HSManStringBase
   static HSManLocalizations of(BuildContext context){
    return Localizations.of(context, HSManLocalizations);
   }
}

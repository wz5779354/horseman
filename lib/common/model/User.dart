import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {


  /// _$HomeModelFromJson 这个函数在.g.dart中，命名就是类名+FromJson
  /// 直接写就行 报错也没关系 生成.g.dart文件之后就好了
/*  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);*/

  // 命名构造函数
  User.empty();
}

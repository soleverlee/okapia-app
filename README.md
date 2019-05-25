# okapia_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:


## 更新json文件

### define entity
```dart
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  SearchView({ this.id, this.name });

  factory SearchView.fromJson(Map<String, dynamic> json) =>
      _$SearchViewFromJson(json);

  Map<String, dynamic> toJson() => _$SearchViewToJson(this);
}
```

### add serializable part file

```dart
part 'user.g.dart';

class User {
  // ...
}
```

### generate part file

一次性更新json文件：

```shell
flutter packages pub run build_runner build
```

持续更新json文件

```shell
flutter packages pub run build_runner watch
```

### add `fromJson` & `toJson` function to entity

```dart
@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "name")
  String name;

  User({ this.id, this.name });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

## 加密算法
http://riguz.com/kdbx4-format/
https://pub.dartlang.org/packages/password

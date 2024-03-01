// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:wan_android_flutter/models/article_classify_entity.dart';
import 'package:wan_android_flutter/models/banner_home_entity.dart';
import 'package:wan_android_flutter/models/base_response_entity.dart';
import 'package:wan_android_flutter/models/collect_article_entity.dart';
import 'package:wan_android_flutter/models/home_article_list_entity.dart';
import 'package:wan_android_flutter/models/user_info_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);
extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(value as Map<String, dynamic>) as T;
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<ArticleClassifyEntity>[] is M) {
      return data.map<ArticleClassifyEntity>((Map<String, dynamic> e) =>
          ArticleClassifyEntity.fromJson(e)).toList() as M;
    }
    if (<ArticleClassifyChildren>[] is M) {
      return data.map<ArticleClassifyChildren>((Map<String, dynamic> e) =>
          ArticleClassifyChildren.fromJson(e)).toList() as M;
    }
    if (<BannerHomeEntity>[] is M) {
      return data.map<BannerHomeEntity>((Map<String, dynamic> e) =>
          BannerHomeEntity.fromJson(e)).toList() as M;
    }
    if (<BaseResponseEntity>[] is M) {
      return data.map<BaseResponseEntity>((Map<String, dynamic> e) =>
          BaseResponseEntity.fromJson(e)).toList() as M;
    }
    if (<CollectArticleEntity>[] is M) {
      return data.map<CollectArticleEntity>((Map<String, dynamic> e) =>
          CollectArticleEntity.fromJson(e)).toList() as M;
    }
    if (<CollectArticleDatas>[] is M) {
      return data.map<CollectArticleDatas>((Map<String, dynamic> e) =>
          CollectArticleDatas.fromJson(e)).toList() as M;
    }
    if (<HomeArticleListEntity>[] is M) {
      return data.map<HomeArticleListEntity>((Map<String, dynamic> e) =>
          HomeArticleListEntity.fromJson(e)).toList() as M;
    }
    if (<HomeArticleListDatas>[] is M) {
      return data.map<HomeArticleListDatas>((Map<String, dynamic> e) =>
          HomeArticleListDatas.fromJson(e)).toList() as M;
    }
    if (<HomeArticleListDatasTags>[] is M) {
      return data.map<HomeArticleListDatasTags>((Map<String, dynamic> e) =>
          HomeArticleListDatasTags.fromJson(e)).toList() as M;
    }
    if (<UserInfoEntity>[] is M) {
      return data.map<UserInfoEntity>((Map<String, dynamic> e) =>
          UserInfoEntity.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (ArticleClassifyEntity).toString(): ArticleClassifyEntity.fromJson,
    (ArticleClassifyChildren).toString(): ArticleClassifyChildren.fromJson,
    (BannerHomeEntity).toString(): BannerHomeEntity.fromJson,
    (BaseResponseEntity).toString(): BaseResponseEntity.fromJson,
    (CollectArticleEntity).toString(): CollectArticleEntity.fromJson,
    (CollectArticleDatas).toString(): CollectArticleDatas.fromJson,
    (HomeArticleListEntity).toString(): HomeArticleListEntity.fromJson,
    (HomeArticleListDatas).toString(): HomeArticleListDatas.fromJson,
    (HomeArticleListDatasTags).toString(): HomeArticleListDatasTags.fromJson,
    (UserInfoEntity).toString(): UserInfoEntity.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}
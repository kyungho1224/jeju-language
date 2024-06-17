import 'dart:convert';

import 'package:http/http.dart';
import 'package:jeju_language/model/dialect.dart';
import 'package:xml2json/xml2json.dart';

import '../model/life_dialect.dart';

class JejuApiService {
  static String base_url = "https://www.jeju.go.kr/rest";

  Future<Dialect> fetchDialectList(int page, int size) async {
    Uri uri = Uri.parse(
        '$base_url/JejuDialectService/getJejuDialectServiceList?page=$page&pageSize=$size');
    final response = await get(uri);
    if (response.statusCode == 200) {
      String xml = utf8.decode(response.bodyBytes);

      Xml2Json xml2json = Xml2Json();
      xml2json.parse(xml);
      String parker = xml2json.toParker();

      return Dialect.fromJson(json.decode(parker));
    }
    throw Exception("");
  }

  Future<LifeDialect> fetchLifeDialectList(int page, int size) async {
    Uri uri = Uri.parse(
        '$base_url/JejuLifeDialectService/getJejuLifeDialectServiceList?startPage=$page&pageSize=$size');
    final response = await get(uri);
    if (response.statusCode == 200) {
      String xml = utf8.decode(response.bodyBytes);

      Xml2Json xml2json = Xml2Json();
      xml2json.parse(xml);
      String parker = xml2json.toParker();

      print('parker : $parker');

      return LifeDialect.fromJson(json.decode(parker));
    }
    throw Exception("");
  }

}

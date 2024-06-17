import 'dart:convert';

class JejuNetItem {
  final int seq;
  final String type;
  final String name;
  final String siteName;
  final String index;
  final String contents;
  final String engContents;
  final String janContents;
  final String chiContents;
  final String sound;
  final String soundUrl;
  final bool use;
  final String category;

  JejuNetItem({
    required this.seq,
    required this.type,
    required this.name,
    required this.siteName,
    required this.index,
    required this.contents,
    required this.engContents,
    required this.janContents,
    required this.chiContents,
    required this.sound,
    required this.soundUrl,
    required this.use,
    required this.category,
  });

  factory JejuNetItem.fromJson(Map<String, dynamic> json) {
    return JejuNetItem(
      seq: json['seq'],
      type: json['type'],
      name: json['name'],
      siteName: json['siteName'],
      index: json['index'],
      contents: json['contents'],
      engContents: json['engContents'],
      janContents: json['janContents'],
      chiContents: json['chiContents'],
      sound: json['sound'],
      soundUrl: json['soundUrl'],
      use: json['use'],
      category: json['category'],
    );
  }
}

class JejuNetApi {
  final String resultCode;
  final String resultMsg;
  final List<JejuNetItem> items;

  JejuNetApi({
    required this.resultCode,
    required this.resultMsg,
    required this.items,
  });

  factory JejuNetApi.fromJson(Map<String, dynamic> json) {
    return JejuNetApi(
      resultCode: json['resultCode'],
      resultMsg: json['resultMsg'],
      items: List<JejuNetItem>.from(json['list'].map((item) => JejuNetItem.fromJson(item))),
    );
  }
}

// import 'package:xml/xml.dart';
//
// class JejuNetItem {
//   final int seq;
//   final String type;
//   final String name;
//   final String siteName;
//   final String index;
//   final String contents;
//   final String engContents;
//   final String janContents;
//   final String chiContents;
//   final String sound;
//   final String soundUrl;
//   final bool use;
//   final String category;
//
//   JejuNetItem({
//     required this.seq,
//     required this.type,
//     required this.name,
//     required this.siteName,
//     required this.index,
//     required this.contents,
//     required this.engContents,
//     required this.janContents,
//     required this.chiContents,
//     required this.sound,
//     required this.soundUrl,
//     required this.use,
//     required this.category,
//   });
//
//   factory JejuNetItem.fromXml(XmlElement element) {
//     return JejuNetItem(
//       seq: int.parse(element.findElements('seq').first.text),
//       type: element.findElements('type').first.text,
//       name: element.findElements('name').first.text,
//       siteName: element.findElements('siteName').first.text,
//       index: element.findElements('index').first.text,
//       contents: element.findElements('contents').first.text,
//       engContents: element.findElements('engContents').first.text,
//       janContents: element.findElements('janContents').first.text,
//       chiContents: element.findElements('chiContents').first.text,
//       sound: element.findElements('sound').first.text,
//       soundUrl: element.findElements('soundUrl').first.text,
//       use: element.findElements('use').first.text.toLowerCase() == 'true',
//       category: element.findElements('category').first.text,
//     );
//   }
// }
//
// class JejuNetApi {
//   final String resultCode;
//   final String resultMsg;
//   final List<JejuNetItem> items;
//
//   JejuNetApi({
//     required this.resultCode,
//     required this.resultMsg,
//     required this.items,
//   });
//
//   factory JejuNetApi.fromXml(String xmlString) {
//     final document = XmlDocument.parse(xmlString);
//     final root = document.rootElement;
//
//     final resultCode = root.findElements('resultCode').first.text;
//     final resultMsg = root.findElements('resultMsg').first.text;
//
//     final items = root.findElements('list').first.findElements('item').map((element) {
//       return JejuNetItem.fromXml(element);
//     }).toList();
//
//     return JejuNetApi(
//       resultCode: resultCode,
//       resultMsg: resultMsg,
//       items: items,
//     );
//   }
// }

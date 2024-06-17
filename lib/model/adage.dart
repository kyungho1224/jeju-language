import 'package:html/parser.dart' as html_parser;

class Adage {
  final String resultCode;
  final String resultMsg;
  final List<AdageItem> adageList;
  final QueryOption queryOption;

  Adage({
    required this.resultCode,
    required this.resultMsg,
    required this.adageList,
    required this.queryOption,
  });

  factory Adage.fromJson(Map<String, dynamic> json) {
    final resultCode = json['jejunetApi']['resultCode'];
    final resultMsg = json['jejunetApi']['resultMsg'];

    // Parsing query option
    final queryOptionJson = json['jejunetApi']['query'];
    final queryOption = QueryOption.fromJson(queryOptionJson);

    // Parsing dialect list
    final List<AdageItem> dialectList = [];

    // Check if list is a single item or a list of items
    dynamic listData = json['jejunetApi']['items'];
    if (listData != null) {
      if (listData['item'] != null) {
        // Single item case
        if (listData['item'] is List) {
          // If listData['item'] is a list, iterate over each item
          listData['item'].forEach((item) {
            dialectList.add(AdageItem.fromJson(item));
          });
        } else {
          // If listData['item'] is not a list but a single item
          dialectList.add(AdageItem.fromJson(listData['item']));
        }
      }
    }

    return Adage(
      resultCode: resultCode,
      resultMsg: resultMsg,
      adageList: dialectList,
      queryOption: queryOption,
    );
  }
}

class QueryOption {
  final String pageSize;
  final String page;
  final String rows;

  QueryOption({
    required this.pageSize,
    required this.page,
    required this.rows,
  });

  factory QueryOption.fromJson(Map<String, dynamic> json) {
    return QueryOption(
      pageSize: json['pageSize'],
      page: json['page'],
      rows: json['rows'],
    );
  }
}

class AdageItem {
  final String seq;
  final String name;
  final String index;
  final String contents;
  final String? original;
  final String engContents;
  final String janContents;
  final String chiContents;
  final String soundUrl;

  AdageItem({
    required this.seq,
    required this.name,
    required this.index,
    required this.contents,
    required this.original,
    required this.engContents,
    required this.janContents,
    required this.chiContents,
    required this.soundUrl,
  });

  factory AdageItem.fromJson(Map<String, dynamic> json) {
    return AdageItem(
      seq: json['seq'],
      name: decodeHtml(json['name']),
      index: json['index'],
      contents: decodeHtml(json['contents']),
      original: json['original'] != null ? decodeHtml(json['original']) : null,
      engContents: decodeHtml(json['engContents']),
      janContents: decodeHtml(json['janContents']),
      chiContents: decodeHtml(json['chiContents']),
      soundUrl: json['soundUrl'],
    );
  }

  static String decodeHtml(String input) {
    return html_parser.parse(input).body?.text ?? input;
  }
}
import 'package:html/parser.dart' as html_parser;

class Dialect {
  final String resultCode;
  final String resultMsg;
  final List<DialectItem> dialectList;
  final QueryOption queryOption;

  Dialect({
    required this.resultCode,
    required this.resultMsg,
    required this.dialectList,
    required this.queryOption,
  });

  factory Dialect.fromJson(Map<String, dynamic> json) {
    final resultCode = json['jejunetApi']['resultCode'];
    final resultMsg = json['jejunetApi']['resultMsg'];

    // Parsing query option
    final queryOptionJson = json['jejunetApi']['query'];
    final queryOption = QueryOption.fromJson(queryOptionJson);

    // Parsing dialect list
    final List<DialectItem> dialectList = [];

    // Check if list is a single item or a list of items
    dynamic listData = json['jejunetApi']['list'];
    if (listData != null) {
      if (listData['item'] != null) {
        // Single item case
        if (listData['item'] is List) {
          // If listData['item'] is a list, iterate over each item
          listData['item'].forEach((item) {
            dialectList.add(DialectItem.fromJson(item));
          });
        } else {
          // If listData['item'] is not a list but a single item
          dialectList.add(DialectItem.fromJson(listData['item']));
        }
      }
    }

    return Dialect(
      resultCode: resultCode,
      resultMsg: resultMsg,
      dialectList: dialectList,
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

class DialectItem {
  final String seq;
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
  final String use;
  final String category;

  DialectItem({
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

  factory DialectItem.fromJson(Map<String, dynamic> json) {
    return DialectItem(
      seq: json['seq'],
      type: json['type'],
      name: decodeHtml(json['name']),
      // name: json['name'],
      siteName: decodeHtml(json['siteName']),
      index: json['index'],
      contents: decodeHtml(json['contents']),
      engContents: decodeHtml(json['engContents']),
      janContents: decodeHtml(json['janContents']),
      chiContents: decodeHtml(json['chiContents']),
      sound: json['sound'],
      soundUrl: json['soundUrl'],
      use: json['use'],
      category: json['category'],
    );
  }

  static String decodeHtml(String input) {
    return html_parser.parse(input).body?.text ?? input;
  }
}
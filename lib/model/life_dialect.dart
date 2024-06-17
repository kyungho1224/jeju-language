import 'package:html/parser.dart' as html_parser;

class LifeDialect {
  final String resultCode;
  final String resultMsg;
  final List<LifeDialectItem> dialectList;
  final QueryOption queryOption;

  LifeDialect({
    required this.resultCode,
    required this.resultMsg,
    required this.dialectList,
    required this.queryOption,
  });

  factory LifeDialect.fromJson(Map<String, dynamic> json) {
    final resultCode = json['jejunetApi']['resultCode'];
    final resultMsg = json['jejunetApi']['resultMsg'];

    // Parsing query option
    final queryOptionJson = json['jejunetApi']['query'];
    final queryOption = QueryOption.fromJson(queryOptionJson);

    // Parsing dialect list
    final List<LifeDialectItem> dialectList = [];

    // Check if list is a single item or a list of items
    dynamic listData = json['jejunetApi']['items'];
    if (listData != null) {
      if (listData['item'] != null) {
        // Single item case
        if (listData['item'] is List) {
          // If listData['item'] is a list, iterate over each item
          listData['item'].forEach((item) {
            dialectList.add(LifeDialectItem.fromJson(item));
          });
        } else {
          // If listData['item'] is not a list but a single item
          dialectList.add(LifeDialectItem.fromJson(listData['item']));
        }
      }
    }

    return LifeDialect(
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

class LifeDialectItem {
  final String seq;
  final String type;
  final String name;
  final String siteName;
  final String contents;
  final String original;
  final String solution;
  final String soundUrl;
  final String imageUrl;
  final String category;
  final String count;

  LifeDialectItem({
    required this.seq,
    required this.type,
    required this.name,
    required this.siteName,
    required this.contents,
    required this.original,
    required this.solution,
    required this.soundUrl,
    required this.imageUrl,
    required this.category,
    required this.count
  });

  factory LifeDialectItem.fromJson(Map<String, dynamic> json) {
    return LifeDialectItem(
      seq: json['seq'],
      type: json['type'],
      name: decodeHtml(json['name']),
      siteName: decodeHtml(json['siteName']),
      contents: decodeHtml(json['contents']),
      original: decodeHtml(json['original']),
      solution: decodeHtml(json['solution']),
      soundUrl: json['soundUrl'],
      imageUrl: json['image1Url'],
      category: json['category'],
      count: json['count'],
    );
  }

  static String decodeHtml(String input) {
    return html_parser.parse(input).body?.text ?? input;
  }
}
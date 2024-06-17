import 'package:flutter/material.dart';
import 'package:jeju_language/model/dialect.dart';

class DialectItemWidget extends StatelessWidget {
  final DialectItem dialectItem;

  const DialectItemWidget({
    super.key,
    required this.dialectItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Card(
        color: Colors.red.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '제목 : ${dialectItem.siteName}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                '내용 : ${dialectItem.contents}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                '영문 : ${dialectItem.engContents}',
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                '일문 : ${dialectItem.janContents}',
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                '중문 : ${dialectItem.chiContents}',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

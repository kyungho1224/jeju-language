import 'package:flutter/material.dart';
import 'package:jeju_language/model/life_dialect.dart';

class LifeDialectDetailScreen extends StatelessWidget {
  final LifeDialectItem lifeDialectItem;

  const LifeDialectDetailScreen({
    super.key,
    required this.lifeDialectItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('제주어 번역기'),
        elevation: 3,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              color: Colors.teal.shade100,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text('제목 : ${lifeDialectItem.name}'),
                    Text('제목풀이 : ${lifeDialectItem.siteName}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        '설명 : ${lifeDialectItem.contents.replaceAll('\\n', '\n')}'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        '원문 : ${lifeDialectItem.original.replaceAll('\\n', '\n')}'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        '원문설명 : ${lifeDialectItem.solution.replaceAll('\\n', '\n')}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

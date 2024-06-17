import 'package:flutter/material.dart';

import '../model/adage.dart';

class AdageDetailScreen extends StatelessWidget {
  final AdageItem adageItem;

  const AdageDetailScreen({
    super.key,
    required this.adageItem,
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
              elevation: 3,
              color: Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('제목 : ${adageItem.name}', style: TextStyle(fontSize: 20),),
                    // SizedBox(height: 8,),
                    // Text('내용 : ${adageItem.contents}', style: TextStyle(fontSize: 16),),
                    // SizedBox(height: 8,),
                    ListTile(
                      title: Text(
                        adageItem.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(adageItem.contents, style: TextStyle(fontSize: 16),),
                    ),
                    ListTile(
                      title: Text(
                        '영문',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(adageItem.engContents),
                    ),
                    ListTile(
                      title: Text(
                        '일문',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(adageItem.janContents),
                    ),
                    ListTile(
                      title: Text(
                        '중문',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(adageItem.chiContents),
                    ),
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

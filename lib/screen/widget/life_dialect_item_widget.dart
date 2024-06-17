import 'package:flutter/material.dart';
import 'package:jeju_language/model/life_dialect.dart';
import 'package:jeju_language/screen/life_dialect_detail_screen.dart';

class LifeDialectItemWidget extends StatelessWidget {
  final LifeDialectItem lifeDialectItem;

  const LifeDialectItemWidget({
    super.key,
    required this.lifeDialectItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Card(
        elevation: 3,
        color: Colors.blue.shade100,
        child: ListTile(
          title: Text(lifeDialectItem.name),
          subtitle: Text(lifeDialectItem.siteName),
          trailing: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LifeDialectDetailScreen(
                    lifeDialectItem: lifeDialectItem,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.read_more_rounded,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

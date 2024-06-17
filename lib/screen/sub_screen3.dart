import 'package:flutter/material.dart';
import 'package:jeju_language/model/adage.dart';
import 'package:jeju_language/screen/adage_detail_screen.dart';

import '../service/jeju_api_service.dart';

class SubScreen3 extends StatefulWidget {
  const SubScreen3({super.key});

  @override
  State<SubScreen3> createState() => _SubScreen3State();
}

class _SubScreen3State extends State<SubScreen3> {
  final JejuApiService jejuApiService = JejuApiService();
  final ScrollController _scrollController = ScrollController();

  List<AdageItem> _items = [];
  int _page = 1;
  final int _size = 20;
  bool _isLoading = false;
  bool _hasMoreData = true;

  Future<void> _fetchDialectList() async {
    if (_isLoading || !_hasMoreData) return;
    setState(() {
      _isLoading = true;
    });

    try {
      final dialect = await jejuApiService.fetchAdageDialectList(_page, _size);
      setState(() {
        _items.addAll(dialect.adageList);
        _page++;
        if (dialect.adageList.length < _size) {
          _hasMoreData = false;
        }
      });
    } catch (e) {
      print('error : $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('error : $e')));
    } finally {
      _isLoading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchDialectList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        _fetchDialectList();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bodyWidget();
  }

  Widget _bodyWidget() {
    if (_items.isEmpty && _isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_items.isEmpty) {
      return const Center(
        child: Text('데이터가 없습니다.'),
      );
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Card(
                elevation: 3,
                color: Colors.green.shade100,
                child: ListTile(
                  title: Text(_items[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdageDetailScreen(
                            adageItem: _items[index],
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
            // return DialectItemWidget(dialectItem: _items[index]);
            return ListTile(
              title: Text(_items[index].name),
              subtitle: Text(_items[index].contents),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
  }
}

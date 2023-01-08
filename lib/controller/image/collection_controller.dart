import 'package:flutter/material.dart';

import '../../data/const.dart';
import '../../data/image/image.dart';

class CollectionController extends ChangeNotifier {
  final List<MyImage> _feeds = feeds;
  final List<MyImage> _collection = [];

  List<MyImage> get myCollection => _collection;
  List<MyImage> get nyFeeds => _feeds;

  void add(MyImage image) {
    _collection.add(image);
    notifyListeners();
  }

  void remove(MyImage image) {
    _collection.remove(image);
    notifyListeners();
  }

  bool isMarked(MyImage image) {
    return _collection.contains(image);
  }

  void removeAll() {
    _collection.clear();
    notifyListeners();
  }
}

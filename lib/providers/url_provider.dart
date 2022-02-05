import 'package:bookmark/models/url_model.dart';
import 'package:flutter/widgets.dart';

class UrlProvider extends ChangeNotifier {
  final List<UrlModel> _urls = [];

  List<UrlModel> get urls => _urls;

  addUrl(item) {
    _urls.add(item);
    notifyListeners();
  }

  deleteUrl(index) {
    _urls.removeAt(index);
    notifyListeners();
  }
}

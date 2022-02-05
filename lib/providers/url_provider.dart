import 'package:bookmark/models/url_model.dart';
import 'package:flutter/widgets.dart';

class UrlProvider extends ChangeNotifier {
  final List<UrlModel> _urls = [];
  bool _favoriteStatus = false;

  bool get favoriteStatus => _favoriteStatus;

  List<UrlModel> get urls => _urls;

  addUrl(item) {
    _urls.add(item);
    notifyListeners();
  }

  deleteUrl(index) {
    _urls.removeAt(index);
    notifyListeners();
  }

  changeFavoriteStatus(status) {
    _favoriteStatus = status;
    notifyListeners();
  }

  changeFavoriteSatusEdit(status, index) {
    urls[index].favorite = status;
    notifyListeners();
  }
}

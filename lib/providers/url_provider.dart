import 'package:bookmark/models/url_model.dart';
import 'package:flutter/widgets.dart';

class UrlProvider extends ChangeNotifier {
  // default values

  bool _favoriteStatus = false;

  // getters

  List<UrlModel> get urls => sortUrls();
  final List<UrlModel> _urls = [];
  bool get favoriteStatus => _favoriteStatus;

// sort the urls according to date

  List<UrlModel> sortUrls() {
    _urls.sort((a, b) {
      var aDate = a.date;
      var bDate = b.date;
      return bDate!.compareTo(aDate!);
    });
    return _urls;
  }

  // adding the url items

  addUrl(item) {
    _urls.add(item);
    notifyListeners();
  }

  // deleting the url items

  deleteUrl(index) {
    _urls.removeAt(index);
    notifyListeners();
  }

  // change favorite status in adding bookmark

  changeFavoriteStatus(status) {
    _favoriteStatus = status;
    notifyListeners();
  }

  // change favorite status in editing bookmark

  changeFavoriteSatusEdit(status, index) {
    _urls[index].favorite = status;
    notifyListeners();
  }
}

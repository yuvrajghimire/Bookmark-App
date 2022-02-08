import 'dart:convert';
import 'package:bookmark/components/variables_constants.dart';
import 'package:bookmark/models/url_model.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences _prefs;

class UrlProvider extends ChangeNotifier {
  // default values

  bool _favoriteStatus = false;
  // ignore: unused_field
  bool _isLoading = true;
  final String _selectedValue = '';
  final String _selectedColor = '';
  final List<UrlModel> _sharedPrefList = [];
  List<UrlModel> _urls = [];
  List _categories = [
    'Any',
    'New ideas',
    'Music',
    'Cooking',
    'Travel',
    'News',
    'Programming',
  ];

  // getters

  List<UrlModel> get urls => sortUrls();
  List get categories => _categories;
  bool get favoriteStatus => _favoriteStatus;
  String get selectedValue => _selectedValue;
  String get selectedColor => _selectedColor;

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
    updatePref();
    notifyListeners();
  }

  // deleting the url items

  deleteUrl(index) {
    _urls.removeAt(index);
    updatePref();
    notifyListeners();
  }

  // edit url

  editUrl(index, title, url, description, category, color, favorite) {
    _urls[index].title = title;
    _urls[index].url = url;
    _urls[index].description = description;
    _urls[index].category = category;
    _urls[index].color = color;
    _urls[index].favorite = favorite;
    updatePref();
    notifyListeners();
  }

  // change category Value

  changeCategory(category, index) {
    _urls[index].category = category;
    updatePref();
    notifyListeners();
  }
  // change color Value

  changeColor(color, index) {
    _urls[index].color = color;
    updatePref();
    notifyListeners();
  }
  // change status Value

  changeFavoriteStatus(status, index) {
    _urls[index].favorite = status;
    updatePref();
    notifyListeners();
  }

  // change favorite status in adding bookmark

  changeFavoriteStatusAdd(status) {
    _favoriteStatus = status;
    notifyListeners();
  }

  // update shared preferences

  updatePref() async {
    _prefs = await SharedPreferences.getInstance();
    var json = jsonEncode(_urls.map((e) => e.toJson()).toList());
    _prefs.setString('urlList', json);
    notifyListeners();
  }

  // update category shared preferences

  updateCategoryPref() async {
    _prefs = await SharedPreferences.getInstance();
    var json = jsonEncode(_categories.map((e) => e).toList());
    _prefs.setString('categoryList', json);
    notifyListeners();
  }

  // getting items from shared preferences

  getUrlItems() async {
    _prefs = await SharedPreferences.getInstance();
    var jsonList = _prefs.getString('urlList');
    try {
      if (jsonList == null) {
        // print('null printed');
        _isLoading = true;
      } else {
        _isLoading = false;
        var convert = await json.decode(jsonList);
        await convert!.forEach((e) {
          _sharedPrefList.add(UrlModel.fromJson(e));
        });
        // print(_sharedPrefList);
      }
    } catch (e) {
      // print(e.toString());
    }
    _urls = _sharedPrefList;
    notifyListeners();
  }

  getCategoryItems() async {
    List _sharedPrefCategoryList = [];
    _prefs = await SharedPreferences.getInstance();
    var jsonList = _prefs.getString('categoryList');
    try {
      if (jsonList == null) {
        // print('null printed');
        _isLoading = true;
      } else {
        _isLoading = false;
        var convert = await json.decode(jsonList);
        _sharedPrefCategoryList = convert;
        // print(_sharedPrefList);
      }
    } catch (e) {
      // print(e.toString());
    }
    _categories.addAll(_sharedPrefCategoryList);
    notifyListeners();
  }

  // add categories
  addCategory(String item) {
    _categories.add(item);
    updateCategoryPref();
    notifyListeners();
  }

  // delete categories
  removeCategory(index) {
    _categories.removeAt(index);
    updateCategoryPref();
    notifyListeners();
  }
}

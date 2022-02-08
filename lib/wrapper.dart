import 'package:bookmark/providers/url_provider.dart';
import 'package:bookmark/screens/favorite.dart';
import 'package:bookmark/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  List pages = [const Home(), const Favorite()];

  @override
  void initState() {
    super.initState();
    Provider.of<UrlProvider>(context, listen: false).getUrlItems();
    Provider.of<UrlProvider>(context, listen: false).getCategoryItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            pages[_currentIndex],
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 47,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    bottomNavigationBarItem(
                        Icon(LineariconsFree.home,
                            size: 25, color: Theme.of(context).primaryColor),
                        0),
                    bottomNavigationBarItem(
                        Icon(Typicons.star,
                            size: 25, color: Theme.of(context).primaryColor),
                        1),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: MediaQuery.of(context).size.width * 0.43,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, 'add');
                  Provider.of<UrlProvider>(context, listen: false)
                      .changeFavoriteStatusAdd(false);
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomNavigationBarItem(Icon icon, index) {
    return Opacity(
      opacity: _currentIndex == index ? 1 : 0.5,
      child: IconButton(
        enableFeedback: false,
        onPressed: () {
          setState(() {
            _currentIndex = index;
          });
        },
        icon: icon,
      ),
    );
  }
}

import 'package:bookmark/components/components.dart';
import 'package:bookmark/components/variables_constants.dart';
import 'package:bookmark/providers/url_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedCategory = 'All';
  snackBarCopyClipboard(context) => SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin:
            const EdgeInsets.only(bottom: 100, top: 10, left: 10, right: 10),
        content: const Text('Text copied to clipboard!',
            style: TextStyle(fontFamily: 'Nunito', fontSize: 16)),
      );
  snackBarInvalidUrl(context) => SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin:
            const EdgeInsets.only(bottom: 100, top: 10, left: 10, right: 10),
        content: const Text('Invalid URL!',
            style: TextStyle(fontFamily: 'Nunito', fontSize: 16)),
      );

  calculateBookmarkLength() {
    var urlProvider = Provider.of<UrlProvider>(context, listen: false);
    var length = 0;
    if (_selectedCategory != 'All') {
      for (int i = 0; i < urlProvider.urls.length; i++) {
        if (urlProvider.urls[i].category == _selectedCategory) {
          length++;
        }
      }
    }
    return length;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UrlProvider>(
      builder: (context, urlData, child) => ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Bookmarks',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Opacity(
                          opacity: 0.6,
                          child: Row(
                            children: [
                              Icon(LineariconsFree.bookmark,
                                  size: 14,
                                  color: Theme.of(context).primaryColor),
                              const SizedBox(width: 2),
                              Text(
                                '${_selectedCategory != 'All' ? calculateBookmarkLength() : urlData.urls.length}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 1),
                    Opacity(
                      opacity: 0.7,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'category');
                        },
                        child: Text(
                          'Browse Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      _selectedCategory,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold),
                    ),
                    PopupMenuButton(
                      tooltip: 'Sort by category',
                      icon: Icon(Icons.more_horiz,
                          size: 25, color: Theme.of(context).primaryColor),
                      itemBuilder: (context) {
                        var categories = [];
                        categories.add('All');
                        for (var element in urlData.categories) {
                          categories.add(element);
                        }
                        return List.generate(
                          categories.length,
                          (categoryIdx) {
                            return PopupMenuItem(
                              height: 35,
                              onTap: () {
                                setState(() {
                                  _selectedCategory = categories[categoryIdx];
                                });
                              },
                              value: categoryIdx,
                              child: Text(categories[categoryIdx],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Nunito')),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          urlData.urls.isEmpty
              ? Center(
                  child: Text(
                    'Empty list. Add a new bookmark',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(bottom: 80),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (_selectedCategory == 'All') {
                        return homeItems(urlData, index);
                      } else if (_selectedCategory ==
                          urlData.urls[index].category) {
                        return homeItems(urlData, index);
                      } else {
                        return const SizedBox();
                      }
                    },
                    itemCount: urlData.urls.length,
                  ),
                ),
        ],
      ),
    );
  }

  homeItems(urlData, index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: color(urlData.urls[index].color),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // print('tapped');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return buildPopupDialogDetail(context, urlData, index);
            },
          );
          // Navigator.pushNamed(context, 'edit', arguments: {'urlIndex': index});
        },
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        urlData.urls[index].title! == ''
                            ? '...'
                            : urlData.urls[index].title!.length > 50
                                ? '${urlData.urls[index].title![0].toUpperCase() + urlData.urls[index].title!.substring(1, 20)}'
                                    '...'
                                : '${urlData.urls[index].title![0].toUpperCase() + urlData.urls[index].title!.substring(1)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          '✦ ${urlData.urls[index].category![0].toUpperCase() + urlData.urls[index].category!.substring(1)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      urlData.urls[index].url!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: 'Nunito',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                tooltip: 'Favorite',
                onPressed: () {
                  if (urlData.urls[index].favorite == true) {
                    urlData.changeFavoriteStatus(false, index);
                  } else {
                    urlData.changeFavoriteStatus(true, index);
                  }
                },
                icon: Icon(
                    urlData.urls[index].favorite! == true
                        ? Typicons.star_filled
                        : Typicons.star,
                    size: 19,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: IconButton(
                tooltip: 'Copy to clipboard',
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: "${urlData.urls[index].url}"));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBarCopyClipboard(context));
                },
                icon: Icon(Icons.copy_outlined,
                    size: 19, color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: PopupMenuButton(
                // initialValue: 2,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Icon(Icons.more_vert,
                    size: 19, color: Theme.of(context).primaryColor),
                itemBuilder: (popupContext) {
                  return List.generate(
                    actions.length,
                    (popupIndex) {
                      return PopupMenuItem(
                        onTap: () async {
                          if (popupIndex == 0) {
                            Future.delayed(
                                const Duration(seconds: 0),
                                () => Navigator.pushNamed(context, 'edit',
                                    arguments: {'urlIndex': index}));
                          } else if (popupIndex == 1) {
                            Clipboard.setData(ClipboardData(
                                text: "${urlData.urls[index].url}"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBarCopyClipboard(context));
                          } else if (popupIndex == 2) {
                            Share.share(urlData.urls[index].url!);
                          } else if (popupIndex == 3) {
                            try {
                              await launch(urlData.urls[index].url!);
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarInvalidUrl(context));
                            }
                          } else {
                            Future.delayed(
                              const Duration(seconds: 0),
                              () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alertDialog(context, index);
                                },
                              ),
                            );
                          }
                        },
                        value: popupIndex,
                        child: Text(actions[popupIndex],
                            style: TextStyle(
                                color: actions[popupIndex] == 'Delete'
                                    ? Colors.red
                                    : Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontFamily: 'Nunito')),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

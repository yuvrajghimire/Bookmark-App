import 'package:bookmark/providers/url_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:provider/provider.dart';

AlertDialog alertDialog(context, index) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: const Text('Confirm',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    content: const Text('Are you sure you wish to delete this item?',
        style: TextStyle(color: Colors.black, fontSize: 16)),
    actions: <Widget>[
      TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('Yes',
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
        onPressed: () {
          Provider.of<UrlProvider>(context, listen: false).deleteUrl(index);
          Navigator.pop(context);
        },
      ),
      TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child:
                Text('No', style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}

AlertDialog alertDialogCategory(context, index, urlData) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: const Text('Confirm',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    content: const Text('Are you sure you wish to delete this item?',
        style: TextStyle(color: Colors.black, fontSize: 16)),
    actions: <Widget>[
      TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('Yes',
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
        onPressed: () {
          urlData.removeCategory(index);
          Navigator.pop(context);
        },
      ),
      TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child:
                Text('No', style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}

AlertDialog alertDialogDiscard(context) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: const Text('Confirm',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
    content: const Text('Discard changes?',
        style: TextStyle(color: Colors.black, fontSize: 16)),
    actions: <Widget>[
      TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('Yes',
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
      TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child:
                Text('No', style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}

willPopScope(
    urlController, descriptionController, titleController, context, widget) {
  if (urlController.text !=
          Provider.of<UrlProvider>(context, listen: false)
              .urls[widget.urlIndex!]
              .url ||
      descriptionController.text !=
          Provider.of<UrlProvider>(context, listen: false)
              .urls[widget.urlIndex!]
              .description ||
      titleController.text !=
          Provider.of<UrlProvider>(context, listen: false)
              .urls[widget.urlIndex!]
              .title) {
    // print(true);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogDiscard(context);
      },
    );
    return Future.value(true);
  } else {
    return Navigator.pop(context);
  }
}

Widget buildPopupDialogDetail(BuildContext context, urlData, index) {
  return Dialog(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    child: Container(
      padding: const EdgeInsets.all(20),
      height: 400,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.title, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              const Text('Title',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                urlData.urls[index].title! == ''
                    ? '...'
                    : '${urlData.urls[index].title![0].toUpperCase() + urlData.urls[index].title!.substring(1)}',
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Divider(color: Colors.black87, height: 20),
          Row(
            children: [
              Icon(LineariconsFree.link_1,
                  color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              const Text('Url',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                urlData.urls[index].url == '' ? '...' : urlData.urls[index].url,
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Divider(color: Colors.black87, height: 20),
          Row(
            children: [
              Icon(Typicons.doc_text,
                  size: 20, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              const Text('Description',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                urlData.urls[index].description == ''
                    ? '...'
                    : '${urlData.urls[index].description![0].toUpperCase() + urlData.urls[index].description!.substring(1)}',
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Divider(color: Colors.black87, height: 20),
          Row(
            children: [
              Icon(Icons.category_outlined,
                  color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              const Text('Category',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${urlData.urls[index].category![0].toUpperCase() + urlData.urls[index].category!.substring(1)}',
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  child: const Text('Edit'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'edit',
                        arguments: {'urlIndex': index});
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

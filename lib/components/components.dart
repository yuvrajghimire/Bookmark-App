import 'package:bookmark/providers/url_provider.dart';
import 'package:flutter/material.dart';
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

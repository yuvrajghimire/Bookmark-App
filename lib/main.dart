import 'package:bookmark/providers/url_provider.dart';
import 'package:bookmark/screens/add_bookmark.dart';
import 'package:bookmark/screens/edit_bookmark.dart';
import 'package:bookmark/screens/category.dart';
import 'package:bookmark/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => UrlProvider())],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffeff1f7),
          primaryColor: const Color(0xff6759e0)),
      initialRoute: '/',
      routes: {
        '/': (context) => const Wrapper(),
        'add': (context) => const AddBookmark(),
        'edit': (context) => const EditBookmark(),
        'category': (context) => const Category(),
      },
    );
  }
}

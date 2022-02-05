import 'package:bookmark/providers/url_provider.dart';
import 'package:bookmark/screens/edit.dart';
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
          primaryColor: const Color(0xff6c60e1)),
      initialRoute: '/',
      routes: {
        '/': (context) => const Wrapper(),
        'edit': (context) => const Edit(),
      },
    );
  }
}

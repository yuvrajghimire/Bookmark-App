import 'package:bookmark/components/variables_constants.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  darkColor(color) {
    if (color == '9f85fc') {
      return const Color(0xff9f85fc);
    } else if (color == 'fcd967') {
      return const Color(0xfffcd967);
    } else if (color == '6fc1fc') {
      return const Color(0xff6fc1fc);
    } else if (color == 'fc74f7') {
      return const Color(0xfffc74f7);
    } else if (color == '6afccb') {
      return const Color(0xff6afccb);
    } else if (color == 'fc9653') {
      return const Color(0xfffc9653);
    } else {
      return const Color(0xfff293a1);
    }
  }

  color(color) {
    if (color == 'fff2c7') {
      return const Color(0xfffff2c7);
    } else if (color == 'd8efff') {
      return const Color(0xffd8efff);
    } else if (color == 'e0d7ff') {
      return const Color(0xffe0d7ff);
    } else if (color == 'fae1f9') {
      return const Color(0xfffae1f9);
    } else if (color == 'b9eedc') {
      return const Color(0xffb9eedc);
    } else if (color == 'fedfcb') {
      return const Color(0xfffedfcb);
    } else {
      return const Color(0xfff2c9cf);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50, 20, 20),
        child: GridView.count(
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2,
          children: List.generate(sortItems.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: color(colors[index]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                          child: Icon(categoryIcons[index],
                              size: 30, color: darkColor(darkColors[index])))),
                  const SizedBox(height: 10),
                  Text(sortItems[index],
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito'))
                ],
              ),
            );
          }),
        ),
      ),
    ));
  }
}

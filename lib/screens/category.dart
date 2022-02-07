import 'package:bookmark/components/variables_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  darkColor(color) {
    if (color == '9f85fc') {
      return const Color(0xff9f85fc);
    } else if (color == 'ba9005') {
      return const Color(0xffba9005);
    } else if (color == '2ca1f4') {
      return const Color(0xff2ca1f4);
    } else if (color == 'fc74f7') {
      return const Color(0xfffc74f7);
    } else if (color == '03a06c') {
      return const Color(0xff03a06c);
    } else if (color == 'fc8332') {
      return const Color(0xfffc8332);
    } else {
      return const Color(0xfffc7488);
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
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new,
                          size: 20, color: Colors.white),
                    ),
                  ),
                  const Center(
                    child: Text('Categories',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontSize: 30,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      children: [
                        Icon(Linecons.tag,
                            color: Theme.of(context).primaryColor, size: 20),
                        const SizedBox(width: 10),
                        const Text('Default Categories',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 18,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        crossAxisCount: 2,
                        children: List.generate(
                          sortItems.length,
                          (index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: color(colors[index]),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                          child: Icon(categoryIcons[index],
                                              size: 30,
                                              color: darkColor(
                                                  darkColors[index])))),
                                  const SizedBox(height: 10),
                                  Text(
                                    sortItems[index],
                                    style: TextStyle(
                                      color: darkColor(darkColors[index]),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Linecons.tag,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Created Categories',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.75),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Center(
                              child: Icon(Icons.add,
                                  color: Theme.of(context).primaryColor))),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        crossAxisCount: 2,
                        children: List.generate(
                          sortItems.length,
                          (index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: color(colors[index]),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                          child: Icon(categoryIcons[index],
                                              size: 30,
                                              color: darkColor(
                                                  darkColors[index])))),
                                  const SizedBox(height: 10),
                                  Text(
                                    sortItems[index],
                                    style: TextStyle(
                                      color: darkColor(darkColors[index]),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookmark/components/variables_constants.dart';
import 'package:bookmark/screens/favorite.dart';
import 'package:bookmark/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  List pages = [const Home(), const Favorite()];

  TextEditingController urlController = TextEditingController();

  String _selectedValue = '';

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
                      spreadRadius: 5,
                      blurRadius: 7,
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
                        Icon(LineariconsFree.star_1,
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
                  _show();
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
          icon: icon),
    );
  }

  void _show() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 5, //spread radius
                              blurRadius: 7, // blur radius
                              offset: const Offset(0, 0),
                            )
                          ],
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: double.infinity,
                      child: TextField(
                        cursorColor: Theme.of(context).primaryColor,
                        cursorHeight: 20,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                        controller: urlController,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                fontFamily: 'Nunito', fontSize: 16),
                            hintText: 'Enter an URL',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          iconEnabledColor: Colors.white,
                          dropdownColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                          isDense: true,
                          icon: const SizedBox(),
                          hint: Row(
                            children: [
                              Icon(
                                Icons.sort_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: 20),
                              Text(_selectedValue,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Theme.of(context).primaryColor))
                            ],
                          ),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Theme.of(context).primaryColor),
                          items: sortItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: SizedBox(
                                width: 130,
                                child: Text(items,
                                    style: const TextStyle(
                                        fontFamily: 'Nunito', fontSize: 16)),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedValue = value!;
                              print(_selectedValue);
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {},
                          child: const Text('Submit',
                              style: TextStyle(fontFamily: 'Nunito'))),
                    )
                  ],
                ),
              ),
            ));
  }
}

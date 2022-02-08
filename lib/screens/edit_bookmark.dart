import 'package:bookmark/components/components.dart';
import 'package:bookmark/components/variables_constants.dart';
import 'package:bookmark/providers/url_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditBookmark extends StatefulWidget {
  int? urlIndex;
  EditBookmark({Key? key, this.urlIndex}) : super(key: key);

  @override
  _EditBookmarkState createState() => _EditBookmarkState();
}

class _EditBookmarkState extends State<EditBookmark> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController urlController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool? favoriteStatus;

  @override
  void initState() {
    super.initState();
  }

  editDetails() {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    widget.urlIndex = arguments['urlIndex'];
    var urlProvider = Provider.of<UrlProvider>(context, listen: false);
    urlController.text = urlProvider.urls[widget.urlIndex!].url!;
    titleController.text = urlProvider.urls[widget.urlIndex!].title!;
    descriptionController.text =
        urlProvider.urls[widget.urlIndex!].description!;
    favoriteStatus = urlProvider.urls[widget.urlIndex!].favorite!;
  }

  @override
  void dispose() {
    super.dispose();
    urlController.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    editDetails();
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          // print('gone back');
          return willPopScope(urlController, descriptionController,
              titleController, context, widget);
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Consumer<UrlProvider>(
            builder: (context, urlData, child) => GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    height: 100,
                    child: const Center(
                      child: Text('Edit Bookmark',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize: 30,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.title,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 5),
                                const Text('Title',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              // padding: const EdgeInsets.only(
                              //     right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2), //color of shadow
                                      spreadRadius: 1, //spread radius
                                      blurRadius: 4, // blur radius
                                      offset: const Offset(0, 0),
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: double.infinity,
                              child: TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                cursorHeight: 20,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontFamily: 'Nunito'),
                                controller: titleController,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                        fontFamily: 'Nunito', fontSize: 16),
                                    hintText: 'Title',
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(LineariconsFree.link_1,
                                      color: Theme.of(context).primaryColor),
                                  const SizedBox(width: 5),
                                  const Text('Url',
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 18,
                                          letterSpacing: 0.3,
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2), //color of shadow
                                        spreadRadius: 1, //spread radius
                                        blurRadius: 4, // blur radius
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                width: double.infinity,
                                child: TextFormField(
                                  validator: (value) {
                                    return value == '' || value!.isEmpty
                                        ? "Cannot leave this field empty"
                                        : null;
                                  },
                                  cursorColor: Theme.of(context).primaryColor,
                                  cursorHeight: 20,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18,
                                      fontFamily: 'Nunito'),
                                  controller: urlController,
                                  decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                          fontFamily: 'Nunito', fontSize: 16),
                                      hintText: 'Url',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(Typicons.doc_text,
                                    size: 20,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 8),
                                const Text('Description',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2), //color of shadow
                                      spreadRadius: 1, //spread radius
                                      blurRadius: 4, // blur radius
                                      offset: const Offset(0, 0),
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: double.infinity,
                              child: TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                cursorHeight: 20,
                                minLines: 5,
                                maxLines: 10,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontFamily: 'Nunito'),
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                        fontFamily: 'Nunito', fontSize: 16),
                                    hintText: 'Description',
                                    border: InputBorder.none,
                                    // focusedBorder: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.category_outlined,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 5),
                                const Text('Category',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, 'category'),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.add, size: 20),
                                      Text('Add',
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 15,
                                              letterSpacing: 0.3,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  menuMaxHeight: 400,
                                  iconEnabledColor: Colors.white,
                                  dropdownColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(20),
                                  isDense: true,
                                  icon: const SizedBox(),
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      const SizedBox(width: 20),
                                      Text(
                                          urlData
                                              .urls[widget.urlIndex!].category!,
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              color: Theme.of(context)
                                                  .primaryColor))
                                    ],
                                  ),
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: Theme.of(context).primaryColor),
                                  items:
                                      urlData.categories.map((dynamic items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: SizedBox(
                                        width: 130,
                                        child: Text(items,
                                            style: TextStyle(
                                                color: urlData
                                                            .urls[widget
                                                                .urlIndex!]
                                                            .category! ==
                                                        items
                                                    ? Colors.orange
                                                    : Theme.of(context)
                                                        .primaryColor,
                                                fontFamily: 'Nunito',
                                                fontSize: 16)),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (dynamic value) {
                                    urlData.changeCategory(
                                        value, widget.urlIndex);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.color_lens_outlined,
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 5),
                                const Text(
                                  'Color',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 18,
                                    letterSpacing: 0.3,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    dropdownColor: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    isDense: true,
                                    icon: const SizedBox(),
                                    hint: Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        const SizedBox(width: 20),
                                        Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: color(urlData
                                                    .urls[widget.urlIndex!]
                                                    .color))),
                                      ],
                                    ),
                                    items: colors.map(
                                      (String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Container(
                                              width: 130,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: color(items))),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (String? value) {
                                      urlData.changeColor(
                                          value, widget.urlIndex);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 45,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor)),
                                  onPressed: () {
                                    willPopScope(
                                        urlController,
                                        descriptionController,
                                        titleController,
                                        context,
                                        widget);
                                  },
                                  child: const Text('Cancel',
                                      style: TextStyle(
                                          fontFamily: 'Nunito', fontSize: 20))),
                            ),
                            const SizedBox(width: 15),
                            SizedBox(
                              width: 120,
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).primaryColor)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate() ==
                                      true) {
                                    Provider.of<UrlProvider>(context,
                                            listen: false)
                                        .editUrl(
                                      widget.urlIndex,
                                      titleController.text,
                                      urlController.text,
                                      descriptionController.text,
                                      urlData.urls[widget.urlIndex!].category,
                                      urlData.urls[widget.urlIndex!].color,
                                      urlData.urls[widget.urlIndex!].favorite,
                                    );
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                      fontFamily: 'Nunito', fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 75,
                    right: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () {
                            if (urlData.urls[widget.urlIndex!].favorite ==
                                true) {
                              urlData.changeFavoriteStatus(
                                  false, widget.urlIndex!);
                            } else {
                              urlData.changeFavoriteStatus(
                                  true, widget.urlIndex!);
                            }
                          },
                          icon: urlData.urls[widget.urlIndex!].favorite == true
                              ? const Icon(Typicons.star_filled)
                              : const Icon(Typicons.star)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

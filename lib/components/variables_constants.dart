import 'dart:ui';

import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

const sortItems = [
  'Any',
  'New ideas',
  'Music',
  'Cooking',
  'Travel',
  'News',
  'Programming',
];
const colors = [
  'e0d7ff',
  'fff2c7',
  'd8efff',
  'fae1f9',
  'b9eedc',
  'fcac76',
  'd2d682'
];
const darkColors = [
  '9f85fc',
  'ba9005',
  '2ca1f4',
  'fc74f7',
  '03a06c',
  'fc8332',
  'f293a1'
];
const actions = [
  'Edit',
  'Copy',
  'Share',
  'Open in browser',
  'Delete',
];

var categoryIcons = [
  Entypo.shuffle,
  Linecons.lightbulb,
  Linecons.music,
  Linecons.food,
  Elusive.flight,
  Linecons.doc,
  FontAwesome5.code,
];

color(color) {
  if (color == 'e0d7ff') {
    return const Color(0xffe0d7ff);
  } else if (color == 'fff2c7') {
    return const Color(0xfffff2c7);
  } else if (color == 'd8efff') {
    return const Color(0xffd8efff);
  } else if (color == 'fae1f9') {
    return const Color(0xfffae1f9);
  } else if (color == 'b9eedc') {
    return const Color(0xffb9eedc);
  } else if (color == 'fcac76') {
    return const Color(0xfffcac76);
  } else {
    return const Color(0xffd2d682);
  }
}

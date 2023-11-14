import 'package:theexperience/utils/utils.dart';

class HomeCardModel {
  String icon;
  String text;
  Widget? child;
  bool isLogout;

  HomeCardModel({
    required this.child,
    required this.icon,
    required this.text,
    this.isLogout = false,
  });
}

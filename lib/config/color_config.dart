import 'package:theexperience/utils/utils.dart';

class ColorConv extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  ColorConv(final String eventryColor) : super(_getColorFromHex(eventryColor));
}

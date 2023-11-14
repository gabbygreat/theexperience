import 'package:theexperience/utils/utils.dart';

extension ContextExtension on BuildContext {
  Future<T?> push<T>(Widget child) {
    return Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }

  Future<T?> go<T>(Widget child) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => child),
      (route) => false,
    );
  }

  void pop<T extends Object?>({bool rootNavigator = false, T? result}) {
    return Navigator.of(this, rootNavigator: rootNavigator).pop(result);
  }
}

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:theexperience/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.logoWith).existsSync(), true);
    expect(File(AppImages.logoWithout).existsSync(), true);
    expect(File(AppImages.splash).existsSync(), true);
  });
}

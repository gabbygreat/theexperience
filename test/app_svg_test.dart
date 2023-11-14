import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:theexperience/resources/resources.dart';

void main() {
  test('app_svg assets test', () {
    expect(File(AppSvg.chevronDown).existsSync(), true);
    expect(File(AppSvg.convert).existsSync(), true);
    expect(File(AppSvg.email).existsSync(), true);
    expect(File(AppSvg.logout).existsSync(), true);
    expect(File(AppSvg.nationality).existsSync(), true);
    expect(File(AppSvg.phone).existsSync(), true);
    expect(File(AppSvg.profileSmall).existsSync(), true);
    expect(File(AppSvg.profile).existsSync(), true);
    expect(File(AppSvg.register).existsSync(), true);
  });
}

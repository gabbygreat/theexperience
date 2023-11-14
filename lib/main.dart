import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:theexperience/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onVerticalDragDown,
          ],
          child: MaterialApp(
            title: 'The Experience',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LoginScreen(),
          ),
        );
      },
    );
  }
}

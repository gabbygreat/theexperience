import 'dart:async';

import 'package:theexperience/utils/utils.dart';
part 'view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  late Timer _timer;
  late TextEditingController email;
  late TextEditingController password;
  ValueNotifier<bool> isReady = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _validateFields();
    });
  }

  void _validateFields() {
    if (email.text.isNotEmpty && password.text.isNotEmpty
        // && RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        //     .hasMatch(email.text)
        ) {
      isReady.value = true;
    } else {
      isReady.value = false;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(this);
  }
}

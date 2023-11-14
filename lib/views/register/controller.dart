import 'dart:async';

import 'package:theexperience/utils/utils.dart';
part 'view.dart';
part 'modal.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterController();
}

class RegisterController extends State<RegisterScreen> {
  late Timer _timer;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController gender;
  late TextEditingController nationality;
  ValueNotifier<bool> isReady = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    phone = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    gender = TextEditingController();
    nationality = TextEditingController();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _validateFields();
    });
  }

  void _validateFields() {
    if (name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        email.text.isNotEmpty &&
        RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
            .hasMatch(email.text) &&
        gender.text.isNotEmpty &&
        nationality.text.isNotEmpty) {
      isReady.value = true;
    } else {
      isReady.value = false;
    }
  }

  void createUser() async {
    LocalUserHistory.instance
        .create(
      UserData(
        name: name.text,
        phone: phone.text,
        email: email.text,
        gender: gender.text.toLowerCase(),
        nationality: nationality.text,
      ),
    )
        .whenComplete(
      () {
        ShowFlushBar.showSuccess(
          context: context,
          perform: () => context.go(
            const HomeScreen(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    gender.dispose();
    nationality.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterView(this);
  }
}

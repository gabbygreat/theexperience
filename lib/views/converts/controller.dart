import 'package:theexperience/utils/utils.dart';
part 'view.dart';

class ConvertsScreen extends StatefulWidget {
  const ConvertsScreen({Key? key}) : super(key: key);

  @override
  State<ConvertsScreen> createState() => ConvertsController();
}

class ConvertsController extends State<ConvertsScreen> {
  ValueNotifier<List<UserData>> users = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    LocalUserHistory.instance
        .getAllUsers()
        .then((value) => users.value = value);
  }

  @override
  Widget build(BuildContext context) {
    return ConvertsView(this);
  }
}

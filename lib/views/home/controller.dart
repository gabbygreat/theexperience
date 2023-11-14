import 'package:theexperience/utils/utils.dart';
import 'package:theexperience/views/home/model.dart';
part 'view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeController();
}

class HomeController extends State<HomeScreen> {
  late List<HomeCardModel> cardList;

  @override
  void initState() {
    super.initState();
    cardList = [
      HomeCardModel(
        child: const RegisterScreen(),
        icon: AppSvg.register,
        text: 'Register New Convert',
      ),
      HomeCardModel(
        child: const ConvertsScreen(),
        icon: AppSvg.convert,
        text: 'All Converts',
      ),
      HomeCardModel(
        child: null,
        icon: AppSvg.profile,
        text: 'My Profile',
      ),
      HomeCardModel(
        child: null,
        icon: AppSvg.logout,
        text: 'Logout',
        isLogout: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}

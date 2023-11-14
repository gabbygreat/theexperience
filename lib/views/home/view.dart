part of 'controller.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            padding: [24].pad,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hello Yomi!",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Welcome back...",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 612.h,
              padding: [24, 53, 24, 0].pad,
              decoration: ShapeDecoration(
                color: ColorConv('#E3EDEE'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 155 / 158,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 10.w,
                      children: controller.cardList
                          .map((e) => GestureDetector(
                                onTap: e.child != null
                                    ? () => context.push(e.child!)
                                    : e.isLogout
                                        ? () => context.go(const LoginScreen())
                                        : null,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(e.icon),
                                      22.verticalSpace,
                                      Text(
                                        e.text,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w300,
                                          color: ColorConv('#000110'),
                                        ),
                                      ),
                                      22.verticalSpace,
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: [0, 0, 0, 50].pad,
              child: Image.asset(
                AppImages.logoWithout,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

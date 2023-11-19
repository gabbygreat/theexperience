part of 'controller.dart';

class ConvertsView extends StatelessView<ConvertsScreen, ConvertsController> {
  const ConvertsView(ConvertsController state, {Key? key})
      : super(state, key: key);

  Widget rowInfo({required String title, required String value}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "$title:",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('All Converts'),
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: [20, 20, 20, 0].pad,
                child: CustomTextInput(
                  hintText: 'Search',
                  onChanged: (p0) async {
                    var users = await LocalUserHistory.instance.getAllUsers();
                    RegExp regex = RegExp(p0.toLowerCase());

                    controller.users.value = users
                        .where((UserData element) =>
                            regex.hasMatch(element.email.toLowerCase()) ||
                            regex.hasMatch(element.name.toLowerCase()) ||
                            regex.hasMatch(element.phone.toLowerCase()) ||
                            regex.hasMatch(element.gender.toLowerCase()) ||
                            regex.hasMatch(element.nationality.toLowerCase()))
                        .toList();
                  },
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
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
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: [0, 0, 0, 50].pad,
                          child: Image.asset(
                            AppImages.logoWithout,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: controller.users,
                        builder: (context, users, _) {
                          return ListView.separated(
                            itemCount: users.length,
                            separatorBuilder: (context, index) =>
                                10.verticalSpace,
                            itemBuilder: (context, index) {
                              var user = users[index];
                              return Container(
                                padding: [20, 11].pad,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    rowInfo(
                                      title: 'Name',
                                      value: user.name,
                                    ),
                                    rowInfo(
                                      title: 'Email',
                                      value: user.email,
                                    ),
                                    rowInfo(
                                      title: 'Telephone',
                                      value: user.phone,
                                    ),
                                    rowInfo(
                                      title: 'Gender',
                                      value: user.gender,
                                    ),
                                    rowInfo(
                                      title: 'Nationality',
                                      value: user.nationality,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

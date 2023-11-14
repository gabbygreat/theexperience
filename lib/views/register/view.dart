part of 'controller.dart';

class RegisterView extends StatelessView<RegisterScreen, RegisterController> {
  const RegisterView(RegisterController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('Register New Converts'),
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.8,
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextInput(
                      fillColor: Colors.white,
                      controller: controller.name,
                      hintText: 'Full name',
                      textCapitalization: TextCapitalization.sentences,
                      prefix: SvgPicture.asset(
                        AppSvg.profileSmall,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    20.verticalSpace,
                    CustomTextInput(
                      fillColor: Colors.white,
                      hintText: 'Phone number',
                      keyboardType: TextInputType.phone,
                      controller: controller.phone,
                      prefix: SvgPicture.asset(
                        AppSvg.phone,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    20.verticalSpace,
                    CustomTextInput(
                      fillColor: Colors.white,
                      controller: controller.email,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefix: SvgPicture.asset(
                        AppSvg.email,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    20.verticalSpace,
                    CustomTextInput(
                      fillColor: Colors.white,
                      hintText: 'Gender',
                      readOnly: true,
                      onTap: () async {
                        var gender = await RegisterModal()
                            .selectGender<String>(context);
                        if (gender != null) {
                          controller.gender.text = gender.capitalize();
                        }
                      },
                      suffixIcon: SvgPicture.asset(
                        AppSvg.chevronDown,
                        fit: BoxFit.scaleDown,
                      ),
                      controller: controller.gender,
                      prefix: SvgPicture.asset(
                        AppSvg.profileSmall,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    20.verticalSpace,
                    CustomTextInput(
                      fillColor: Colors.white,
                      hintText: 'Nationality',
                      textCapitalization: TextCapitalization.sentences,
                      controller: controller.nationality,
                      prefix: SvgPicture.asset(
                        AppSvg.nationality,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    20.verticalSpace,
                    ValueListenableBuilder(
                      valueListenable: controller.isReady,
                      builder: (context, ready, _) {
                        return AppButton(
                          isReady: ready,
                          onTap: controller.createUser,
                          text: 'Add new convert',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

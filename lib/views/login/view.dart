part of 'controller.dart';

class LoginView extends StatelessView<LoginScreen, LoginController> {
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: [29].pad,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppImages.logoWith,
                ),
              ),
              38.verticalSpace,
              CustomTextInput(
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your Counselor ID',
              ),
              35.verticalSpace,
              CustomTextInput(
                controller: controller.password,
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
              ),
              46.verticalSpace,
              ValueListenableBuilder(
                valueListenable: controller.isReady,
                builder: (context, ready, _) {
                  return AppButton(
                    isReady: ready,
                    onTap: () => context.go(const HomeScreen()),
                    text: 'Login',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

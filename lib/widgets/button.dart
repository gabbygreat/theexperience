import 'package:theexperience/utils/utils.dart';

class AppButton extends StatefulWidget {
  final String text;
  final void Function() onTap;
  final bool isReady;
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isReady,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isReady ? widget.onTap : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        backgroundColor: Colors.black,
        fixedSize: Size(double.maxFinite, 48.h),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

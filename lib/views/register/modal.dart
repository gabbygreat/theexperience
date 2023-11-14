part of 'controller.dart';

class RegisterModal {
  Future<T?> selectGender<T>(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: [20, 10, 20, 50].pad,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Male'),
              onTap: () => context.pop(result: 'male'),
            ),
            ListTile(
              title: const Text('Female'),
              onTap: () => context.pop(result: 'female'),
            ),
          ],
        ),
      ),
    );
  }
}

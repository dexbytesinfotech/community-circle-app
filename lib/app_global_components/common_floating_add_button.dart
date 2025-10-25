import '../imports.dart';

class CommonFloatingAddButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function() onPressed;
  const CommonFloatingAddButton({super.key,this.padding, this.backgroundColor, this.foregroundColor, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
            padding: padding ??  const EdgeInsets.only(bottom: 25, right: 20),
            child: FloatingActionButton(
                backgroundColor: backgroundColor ?? AppColors.textBlueColor,
                foregroundColor: foregroundColor ?? AppColors.white,
                onPressed: onPressed,
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
            ))
      ],
    );
  }
}

import '../core/util/app_theme/text_style.dart';
import '../imports.dart';

class CommonSearchBar extends StatelessWidget {
  final void Function(String)? onChangeTextCallBack;
  final void Function()? onClickCrossCallBack;
  final TextEditingController controller;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CommonSearchBar({super.key, this.onChangeTextCallBack, required this.controller, this.hintText, this.onClickCrossCallBack, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 5, bottom: 0),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 19),
      height: 50,
      color: const Color(0xFFF5F5F5),
      child: TextField(
        controller: controller,
        onChanged: onChangeTextCallBack,

        //     (searchText) {
        //
        //
        //   filter(searchText, findHelperBloc.findHelperData);
        // },
        style: appTextStyle.appNormalSmallTextStyle(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 0.4,color: Colors.grey.shade500)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 0.4,color: Colors.grey.shade500)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 0.4,color: Colors.grey.shade500)),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText ?? AppString.searchHelper,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset('assets/images/cross_icon.svg'),
            ),
            onPressed: onClickCrossCallBack

            //     () {
            //   controller.clear();
            //   FocusScope.of(context).unfocus();
            //   if (controller.text.isEmpty) {
            //     searchedItems = findHelperBloc.findHelperData;
            //   }
            // },
          )
              : null,
          contentPadding: const EdgeInsets.only(top: 0),
        ),
      ),
    );
  }
}

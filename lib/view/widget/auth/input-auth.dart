import 'package:devbey/view/custom/adaptable-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputAuth extends StatelessWidget {
  InputAuth({
    Key? key,
    required this.title,
    required this.isoBscureText,
    this.keyboardType,
    required this.validator,
    required this.onSave,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  String title;
  bool isoBscureText;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final String? Function(String? email) validator;
  final void Function(String? email) onSave;
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size size = mediaQueryData.size;
    double width = size.width;
    double height = size.height;
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 12 / 1,
          child: AdaptableText(
            title,
            textAlign: TextAlign.center,
            style: getTextStyleTitleFiled(),
          ),
        ),
        SizedBox(
          height: height * 0.005,
        ),
        SizedBox(
          width: isLandscape ? width * 0.5 : width * 0.7,
          child: TextFormField(
            textAlign: TextAlign.left,
            keyboardType: keyboardType,
            obscureText: isoBscureText,
            decoration: getInputDecoration(),
            validator: validator,
            onSaved: onSave,
          ),
        ),
      ],
    );
  }

  TextStyle getTextStyleTitleFiled() => TextStyle(
        fontSize: 20.sp,
        color: Colors.grey,
        fontWeight: FontWeight.w300,
      );

  InputDecoration getInputDecoration() => InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10.sp),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(),
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      );
}

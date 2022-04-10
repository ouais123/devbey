import 'package:devbey/view/custom/adaptable-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchVehiclesInput extends StatelessWidget {
  SearchVehiclesInput({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.icon,
    required this.content,
    required this.onTap,
    required this.validator,
  }) : super(key: key);
  String title;
  String initialValue;
  IconData icon;
  Widget content;
  final void Function()? onTap;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdaptableText(
              title,
              style: getTextStyleTitleFiled(),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            FormField<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: initialValue,
              validator: validator,
              builder: (formFieldState) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(
                      5.sp,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(
                          5.sp,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          Icon(
                            icon,
                            color: Colors.red.withOpacity(0.8),
                            size: 22.sp,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.01,
                          ),
                          content,
                        ],
                      ),
                    ),
                  ),
                  if (formFieldState.hasError)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.sp, vertical: 2.sp),
                      child: Text(
                        "${formFieldState.errorText}",
                        style: TextStyle(
                          color: Colors.red[700],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle getTextStyleTitleFiled() => TextStyle(
        fontSize: 20.sp,
        color: Colors.grey,
        fontWeight: FontWeight.w300,
      );
}

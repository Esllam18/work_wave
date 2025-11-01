import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String txt;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final String? fontFamily;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.txt,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.fontFamily,
    this.letterSpacing,
    this.fontStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ استخدم flutter_screenutil لتكبير وتصغير النص بشكل متناسب مع حجم الشاشة
    final double responsiveFontSize = fontSize != null
        ? fontSize!.sp
        : (style?.fontSize ?? 16.sp);

    final TextStyle baseStyle =
        (style ?? Theme.of(context).textTheme.bodyLarge!).copyWith(
          fontSize: responsiveFontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
        );

    return Text(
      txt,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: baseStyle,
    );
  }
}

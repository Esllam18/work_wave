import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import '../consts/app_colors.dart';

class CustomTextormField extends StatefulWidget {
  const CustomTextormField({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.fillColor = AppColors.secondary,
    void Function(String query)? onChanged,
  });
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final IconData? prefixIcon;
  final Color? fillColor;

  @override
  State<CustomTextormField> createState() => _CustomTextormFieldState();
}

class _CustomTextormFieldState extends State<CustomTextormField> {
  late bool _obscure;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      obscureText: _obscure,
      focusNode: _focusNode,

      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: _toggleObscure,
                child: Icon(
                  _obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: Colors.grey[400],
                  size: 20,
                ),
              )
            : null,

        hint: CustomText(
          txt: widget.hint,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff626262),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        contentPadding: EdgeInsets.all(16),
        fillColor: widget.fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.primary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(style: BorderStyle.none),
        ),
      ),
    );
  }
}

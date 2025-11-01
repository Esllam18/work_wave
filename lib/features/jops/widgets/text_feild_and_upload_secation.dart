import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_wave/core/consts/app_assets.dart';
import 'package:work_wave/core/consts/app_colors.dart';
import 'package:work_wave/core/widgets/custom_snackbar.dart';
import 'package:work_wave/core/widgets/custom_text.dart';
import 'package:work_wave/core/widgets/custom_text_form_field.dart';

class TextFeildAndUploadSecation extends StatefulWidget {
  const TextFeildAndUploadSecation({super.key});

  @override
  State<TextFeildAndUploadSecation> createState() =>
      _TextFeildAndUploadSecationState();
}

class _TextFeildAndUploadSecationState
    extends State<TextFeildAndUploadSecation> {
  File? uploadedPdf;

  Future<void> uploadPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        uploadedPdf = File(result.files.single.path!);
      });

      CustomSnackBar.show(
        context,
        message: 'PDF uploaded successfully ',
        type: SnackBarType.success,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: 'Cover Later',
              children: [
                TextSpan(
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ).fontFamily,
                  ),
                  text: '(Optional)',
                ),
              ],
              style: TextStyle(
                fontFamily: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ).fontFamily,
              ),
            ),
          ),
          Gap(16.h),
          Row(
            children: [
              Expanded(
                child: CustomTextormField(
                  hint: 'Search a job or position',
                  maxLines: 3,

                  fillColor: Colors.white,
                ),
              ),
              SizedBox(width: 6.w),
              GestureDetector(
                onTap: uploadPdf,
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: uploadedPdf == null
                      ? Column(
                          spacing: 2,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                AppIcons.upload,
                                width: 22.w,
                                height: 25.h,
                              ),
                            ),

                            CustomText(
                              txt: 'Upload \n PDF',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff356899),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xffE9F6EF),
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.picture_as_pdf,
                                color: AppColors.primary,
                                size: 22,
                              ),
                              SizedBox(width: 6.w),
                              Flexible(
                                child: CustomText(
                                  txt: uploadedPdf!.path.split('/').last,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    uploadedPdf = null;
                                  });
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.redAccent,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

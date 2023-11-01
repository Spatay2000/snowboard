import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/features/common/skibo_color.dart';

class CustomButton extends StatelessWidget {
  final bool showBlackColor;
  final bool showIcon;
  final String text;
  final Function()? onTap;
  final bool isTextCentered;

  const CustomButton({
    super.key,
    this.showBlackColor = true,
    this.showIcon = false,
    required this.text,
    this.onTap,
    this.isTextCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: isTextCentered
            ? const EdgeInsets.symmetric(vertical: 16).r
            : const EdgeInsets.only(top: 16, bottom: 16, left: 52).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45.r),
          color: showBlackColor == true
              ? SkiboColor.defaultColorButton
              : SkiboColor.secondaryColorButton,
        ),
        child: Row(
          mainAxisAlignment: isTextCentered
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            showIcon == false
                ? const SizedBox()
                : SvgPicture.asset('assets/svg/phone.svg'),
            showIcon == false ? const SizedBox() : SizedBox(width: 61.w),
            Padding(
              padding: showBlackColor == false
                  ? const EdgeInsets.only(left: 80).r
                  : EdgeInsets.zero,
              child: Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

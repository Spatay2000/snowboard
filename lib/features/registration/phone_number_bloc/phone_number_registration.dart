import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/core/get_it/configurator.dart';
import 'package:snowboard/features/common/custom_app_bar.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/custom_textfield.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/registration/phone_number_bloc/bloc/phone_number_register_bloc.dart';

@RoutePage()
class PhoneNumberRegistrationScreen extends StatefulWidget {
  final String userId;
  const PhoneNumberRegistrationScreen({super.key, required this.userId});

  @override
  State<PhoneNumberRegistrationScreen> createState() =>
      _PhoneNumberRegistrationScreenState();
}

class _PhoneNumberRegistrationScreenState
    extends State<PhoneNumberRegistrationScreen> {
  // String? _selectedCode;
  TextEditingController phoneNumberController = TextEditingController();
  final registerPhoneNumber = getIt<PhoneNumberRegisterBloc>();
  String unformatPhoneNumber(String formattedPhoneNumber) {
    return formattedPhoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (context) => registerPhoneNumber,
        child: BlocConsumer<PhoneNumberRegisterBloc, PhoneNumberRegisterState>(
          listener: (context, state) {
            if (state is RegisterPhoneNumberFailure) {
              state.message;
            } else if (state is RegisterPhoneNumberSuccess) {
              context.router.push(const VerificationRoute());
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 90.h),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Войти с помощью\nНомера Телефона',
                      style: GoogleFonts.inter(
                        color: SkiboColor.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Text(
                      'Номер телефона',
                      style: GoogleFonts.inter(
                        color: SkiboColor.defaultColorButton,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    CustomTextField(
                      controller: phoneNumberController,
                      hintText: 'Номер телефона',
                      type: SkiboInputType.number,
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: 59.h,
                    //       width: 90.w,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: SkiboColor.focusedBorderColor, width: 1.w),
                    //         borderRadius: BorderRadius.circular(15.r),
                    //       ),
                    //       child: DropdownButton(
                    //         iconSize: 10.h,
                    //         padding: EdgeInsets.only(
                    //           top: 20.h,
                    //           bottom: 20.h,
                    //           left: 27.w,
                    //         ),
                    //         icon: Padding(
                    //           padding: EdgeInsets.only(left: 5.w),
                    //           child: SvgPicture.asset(
                    //             'assets/svg/drop_down_arrow.svg',
                    //             height: 10.h,
                    //             width: 10.h,
                    //           ),
                    //         ),
                    //         underline: const SizedBox.shrink(),
                    //         value: _selectedCode,
                    //         style: GoogleFonts.inter(
                    //           color: SkiboColor.blackColor,
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 12.sp,
                    //         ),
                    //         items: ['+77', '+88', '+99']
                    //             .map(
                    //               (code) => DropdownMenuItem(
                    //                 value: code,
                    //                 child: Text(
                    //                   code,
                    //                   style: GoogleFonts.inter(
                    //                     color: SkiboColor.blackColor,
                    //                     fontWeight: FontWeight.w600,
                    //                     fontSize: 12.sp,
                    //                   ),
                    //                 ),
                    //               ),
                    //             )
                    //             .toList(),
                    //         onChanged: (value) =>
                    //             setState(() => _selectedCode = value),
                    //       ),
                    //     ),
                    //     SizedBox(width: 18.w),
                    //     Expanded(
                    //       child: Container(
                    //         height: 59.h,
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //               color: SkiboColor.focusedBorderColor, width: 1.w),
                    //           borderRadius: BorderRadius.circular(15.r),
                    //         ),
                    //         child: TextField(
                    //           keyboardType: TextInputType.number,
                    //           style: GoogleFonts.inter(
                    //             color: SkiboColor.blackColor,
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 12.sp,
                    //           ),
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             contentPadding: EdgeInsets.only(
                    //               top: 20.h,
                    //               bottom: 20.h,
                    //               left: 24.w,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 192.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: CustomButton(
                        onTap: () {
                          registerPhoneNumber.add(RegisterPhoneNumber(
                              userId: widget.userId,
                              phoneNumber: "7${unformatPhoneNumber(phoneNumberController.text)}"));
                        },
                        text: 'Подтвердить',
                        isTextCentered: true,
                      ),
                    ),
                    SizedBox(height: 235.h),
                    RowTextInAuth(
                      mainAxisAlignment: MainAxisAlignment.center,
                      text: 'У вас еще нет учетной записи?',
                      textSecond: 'Зарегистрироваться',
                      onTap: () =>
                          context.router.push(const RegistrationRoute()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/equipment_list.dart';

@RoutePage()
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Расписание',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 22, horizontal: 19).r,
              child: const EquipmentList(),
              
            ),
            Padding(
              padding: const EdgeInsets.only(left: 39,right: 38,bottom: 20).r,
              child: CustomButton(
                showBlackColor: false,
                isTextCentered: true,
                text: 'Отменить заниятие',
                borderRadius: 15.r,
                onTap: () => null,
              ),
            )
          ],
        ),
      ),
    );
  }
}

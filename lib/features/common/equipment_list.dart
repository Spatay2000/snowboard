import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/common/spaced_column.dart';

class EquipmentModel {
  final String name;
  final int quantity;
  final List<String> listOfSizes;
  final List<int> listOfQuantity;
  final String image;

  const EquipmentModel({
    required this.name,
    required this.quantity,
    this.listOfSizes = const [],
    this.listOfQuantity = const [],
    required this.image,
  });
}

class EquipmentList extends StatelessWidget {
  const EquipmentList({super.key});

  @override
  Widget build(BuildContext context) {
    const List<EquipmentModel> listOfEquipments = [
      EquipmentModel(
        name: 'Шлем',
        quantity: 2,
        listOfSizes: ['M'],
        listOfQuantity: [2],
        image: 'assets/png/test1.png',
      ),
      EquipmentModel(
        name: 'Очки',
        quantity: 2,
        listOfSizes: ['M'],
        listOfQuantity: [2],
        image: 'assets/png/test2.png',
      ),
      EquipmentModel(
        name: 'Куртка',
        quantity: 2,
        listOfSizes: ['M', '70'],
        listOfQuantity: [1, 1],
        image: 'assets/png/test3.png',
      ),
      EquipmentModel(
        name: 'Штаны',
        quantity: 2,
        listOfSizes: ['M', 'L'],
        listOfQuantity: [1, 1],
        image: 'assets/png/test4.png',
      ),
      EquipmentModel(
        name: 'Перчатки',
        quantity: 2,
        listOfSizes: ['8', '10'],
        listOfQuantity: [1, 1],
        image: 'assets/png/test5.png',
      ),
      EquipmentModel(
        name: 'Ботинки',
        quantity: 2,
        listOfSizes: ['38', '42'],
        listOfQuantity: [1, 1],
        image: 'assets/png/test6.png',
      ),
      EquipmentModel(
        name: 'Лыжи',
        quantity: 2,
        listOfSizes: ['150', '180'],
        listOfQuantity: [1, 1],
        image: 'assets/png/test7.png',
      ),
      EquipmentModel(
        name: 'Палки',
        quantity: 2,
        listOfSizes: ['130', '190'],
        listOfQuantity: [1, 1],
        image: 'assets/png/test8.png',
      ),
      EquipmentModel(
        name: 'Ски-пасс',
        quantity: 2,
        image: 'assets/png/test9.png',
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: SkiboColor.gray5Color,
        border: Border.all(color: SkiboColor.gray4Color),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: listOfEquipments.length + 1,
        separatorBuilder: (context, index) => Container(
          color: SkiboColor.gray6Color,
          width: double.infinity,
          height: 1.h,
        ),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 26.w),
          child: index < listOfEquipments.length
              ? _EquipmentCard(equipment: listOfEquipments[index])
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Цена: 12000 ТГ',
                      style: GoogleFonts.inter(
                        color: SkiboColor.blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      'Количество: 2 шт',
                      style: GoogleFonts.inter(
                        color: SkiboColor.blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _EquipmentCard extends StatelessWidget {
  final EquipmentModel equipment;

  const _EquipmentCard({required this.equipment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${equipment.name}: ${equipment.quantity}',
                style: GoogleFonts.inter(
                  color: SkiboColor.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp,
                ),
              ),
              if (equipment.listOfQuantity.isNotEmpty) ...[
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SpacedColumn(
                      space: 7,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            i < equipment.listOfSizes.length;
                            i++) ...[
                          Text(
                            'Размер: ${equipment.listOfSizes[i]}',
                            style: GoogleFonts.inter(
                              color: SkiboColor.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SpacedColumn(
                      space: 7,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0;
                            i < equipment.listOfQuantity.length;
                            i++) ...[
                          Text(
                            'Количество: ${equipment.listOfQuantity[i]}',
                            style: GoogleFonts.inter(
                              color: SkiboColor.blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        SizedBox(
          width: 85.w,
          child: Center(
            child: Image.asset(equipment.image, fit: BoxFit.none),
          ),
        ),
      ],
    );
  }
}

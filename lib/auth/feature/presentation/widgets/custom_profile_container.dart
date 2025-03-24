import 'package:authentication/auth/feature/presentation/widgets/custom_text.dart';
import 'package:authentication/core/constant/colorsHelper.dart';
import 'package:authentication/core/constant/dimensionHelper.dart';
import 'package:authentication/core/constant/fontsHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileContainer extends StatelessWidget {
  final EdgeInsetsGeometry ?margin;
  final String ?title;
  final String ?subTitle;
  const CustomProfileContainer({super.key, this.margin, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DimensionHelper.dimens_all,
      margin: margin,
      height: DimensionHelper.dimens_80,
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_14,vertical: DimensionHelper.dimens_8),
      decoration: BoxDecoration(
        color: Colors.yellow,
         borderRadius: BorderRadius.circular(DimensionHelper.dimens_20.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontsize: FontHelper.font_22,
          ),

          Row(
            children: [
              SizedBox(width: DimensionHelper.dimens_10.w,),
              CustomText(
                color: ColorsHelper.nBlue,
                text: subTitle,
                fontsize: FontHelper.font_18,
              ),
            ],
          )
        ],
      ),
    );
  }
}

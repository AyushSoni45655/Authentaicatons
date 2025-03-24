import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colorsHelper.dart';
import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/fontsHelper.dart';
import '../../../../core/constant/helper_funcction.dart';
import 'custom_text.dart';

class CustomSignupDesign extends StatelessWidget {
  final VoidCallback? logOut;
  final bool isIcon;
  final double? height;
  final VoidCallback? callback;
  final String? title;
  final String? sTitle;
  const CustomSignupDesign({
    super.key,
    this.callback,
    this.title,
    this.sTitle,
    this.height,
    this.isIcon = true,
    this.logOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: DimensionHelper.dimens_30.sp,
        vertical: DimensionHelper.dimens_30.sp,
      ),
      height: height ?? AHelperFunction.screenSize(context).height * .26,
      width: AHelperFunction.screenSize(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(DimensionHelper.dimens_50.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isIcon
              ? InkWell(
                onTap: callback,
                child: Container(
                  padding: EdgeInsets.all(DimensionHelper.dimens_4.sp),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: ColorsHelper.nBlue),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: DimensionHelper.dimens_30.sp,
                  ),
                ),
              )
              : SizedBox(),
          SizedBox(height: DimensionHelper.dimens_10.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isIcon
                  ? CustomText(
                    textAlign: TextAlign.left,
                    text: title,
                    fontWeight: FontWeight.w800,
                    fontsize: FontHelper.font_36,
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        textAlign: TextAlign.left,
                        text: title,
                        fontWeight: FontWeight.w800,
                        fontsize: FontHelper.font_36,
                      ),
                      IconButton(
                        onPressed: logOut,
                        icon: Icon(Icons.logout, size: 30, color: Colors.red),
                      ),
                    ],
                  ),
              //SizedBox(height: DimensionHelper.dimens_4.h,),
              CustomText(
                color: ColorsHelper.nBlue,
                text: sTitle,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w900,
                fontsize: FontHelper.font_18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

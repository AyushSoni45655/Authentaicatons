import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/assetsHelper.dart';
import '../../../../core/constant/colorsHelper.dart';
import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/fontsHelper.dart';
class CustomButton extends StatelessWidget {

  final EdgeInsetsGeometry ?margin;
  final double ?height;
  final double ?width;
  final bool iconTrue;
  final String? text;
  final bool  cText;
  final Color ?color;
  final VoidCallback? callback;
  const CustomButton({super.key, this.height = 50, this.width = DimensionHelper.dimens_all, this.text, this.callback, this.cText = true, this.color,  this.iconTrue = false, this.margin,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: cText?null:Border.all(color: CupertinoColors.black,width: 2),
            color: cText?color??ColorsHelper.blackColor:ColorsHelper.transparent,
            borderRadius: BorderRadius.circular(DimensionHelper.dimens_16.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconTrue? Image.asset(AssetsHelper.google,height: DimensionHelper.dimens_60,width: DimensionHelper.dimens_60,):SizedBox(),
            SizedBox(width: DimensionHelper.dimens_30.w,),
            Text(text??"",textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontHelper.font_24,
                color:cText? ColorsHelper.nBlue:CupertinoColors.black
            ),),
          ],
        ),
      ),
    );
  }
}

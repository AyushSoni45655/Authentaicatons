import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String ?text;
  final TextAlign ?textAlign;
  final Color ?color;
  final double ? letterSpacing;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry ?padding;
  final int ?maxLines;
  final TextOverflow? overflow;
  final VoidCallback ? callback;
  final AlignmentGeometry ?alignment;
  final double ?fontsize;
  final FontWeight ?fontWeight;

  const CustomText({super.key, this.text, this.color, this.alignment, this.fontWeight, this.callback, this.textAlign, this.fontsize, this.maxLines = 40, this.overflow, this.padding, this.margin, this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: margin,
        padding: padding,
        alignment: alignment,
        child: Text(text??'',style: TextStyle(
            color: color?? Colors.black,
            fontSize: fontsize??26,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight??FontWeight.bold
        ),
          textAlign: textAlign??TextAlign.center,
          maxLines: maxLines,
          overflow: overflow,
        ),
      ),
    );
  }
}

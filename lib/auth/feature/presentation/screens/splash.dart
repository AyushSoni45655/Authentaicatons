import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_button.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_text.dart';
import 'package:authentication/core/constant/assetsHelper.dart';
import 'package:authentication/core/constant/dimensionHelper.dart';
import 'package:authentication/core/constant/fontsHelper.dart';
import 'package:authentication/core/constant/helper_funcction.dart';
import 'package:authentication/core/constant/stringHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // hii
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate();
    });
  }

  void _navigate() async {
    try {
      await Future.delayed(Duration(seconds: 0));
      context.read<UserBloc>().add(UserIsLoggedInEvent());
    } catch (e) {
      debugPrint("Error in  the navigation: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
  listener: (context, state) {
    if(state is UserLoggedIn){
      context.go("/home");
    }else if(state is UserLogOut){
      context.go("/signin");
    }else{
      context.go("/");
    }
  },
  builder: (context, state) {
    return Scaffold(
      body:Container(
        height: AHelperFunction.screenSize(context).height,
        width: AHelperFunction.screenSize(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsHelper.sImage),
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AHelperFunction.screenSize(context).height * .4),
            CustomText(
              margin: EdgeInsets.only(right: DimensionHelper.dimens_30.sp),
              textAlign: TextAlign.left,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontsize: FontHelper.font_36,
              text: StringHelper.sTitle,
            ),
            SizedBox(height: AHelperFunction.screenSize(context).height * .18),
            Container(
              height: AHelperFunction.screenSize(context).height * .3,
              width: AHelperFunction.screenSize(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(DimensionHelper.dimens_60.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: DimensionHelper.dimens_30.w,
                  vertical: DimensionHelper.dimens_30.h,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textAlign: TextAlign.left,
                        text: StringHelper.sSTitle,
                        fontsize: FontHelper.font_18.sp,
                      ),
                      SizedBox(height: DimensionHelper.dimens_20.h,),
                      CustomButton(
                        callback: () {
                          context.go("/signin");
                        },
                        height: DimensionHelper.dimens_34.h,
                        text: StringHelper.signin,
                      ),
                      SizedBox(height: DimensionHelper.dimens_10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            fontsize: FontHelper.font_16.sp,
                            text: StringHelper.oCA,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(width: DimensionHelper.dimens_10.w,),
                          IconButton(onPressed: (){
                            context.go("/signup");
                          }, icon: Icon(Icons.arrow_forward,size: DimensionHelper.dimens_30,))
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      )
    );
  },
);
  }
}

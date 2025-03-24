import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_profile_container.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_signup_design.dart';
import 'package:authentication/core/constant/colorsHelper.dart';
import 'package:authentication/core/constant/dimensionHelper.dart';
import 'package:authentication/core/constant/helper_funcction.dart';
import 'package:authentication/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.black3e,
      body: SingleChildScrollView(
        child: Column(
            children: [
              CustomSignupDesign(
                logOut: () {
                  context.read<UserBloc>().add(UserLogOutEvent());
                  context.go("/signin");
                },
                isIcon: false,
                height: AHelperFunction.screenSize(context).height * .18,
                title: "Profile",
              ),
              BlocBuilder<UserBloc, UserState>(
  builder: (context, state) {
    if(state is UserError){
      Utils().toastMessage(state.error.toString());
    }
    if(state is UserFetchUserData){
      final data = state.userEntity;
      return Column(
        children: [
          SizedBox(height: DimensionHelper.dimens_60.h,),
          CustomProfileContainer(
            margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_10),
            title: "Name",
            subTitle: data.name.toString(),
          ),
          SizedBox(height: DimensionHelper.dimens_20.h,),
          CustomProfileContainer(
            margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_10),
            title: "Email",
            subTitle: data.email.toString(),
          ),
          SizedBox(height: DimensionHelper.dimens_20.h,),
          CustomProfileContainer(
            margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_10),
            title: "Id",
            subTitle: data.id.toString(),
          ),
          SizedBox(height: DimensionHelper.dimens_20.h,),
          CustomProfileContainer(
            margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_10),
            title: "Phone Number",
            subTitle: data.phoneNumber.toString(),
          ),
          SizedBox(height: DimensionHelper.dimens_20.h,),
        ],
      );
    }
   return SizedBox();
  },
)
           
            ]),
      )
    );
  }
}

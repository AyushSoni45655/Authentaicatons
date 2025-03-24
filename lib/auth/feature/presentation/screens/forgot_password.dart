import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_button.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_signup_design.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_text_fiels.dart';
import 'package:authentication/core/constant/dimensionHelper.dart';
import 'package:authentication/core/constant/helper_funcction.dart';
import 'package:authentication/core/constant/stringHelper.dart';
import 'package:authentication/core/constant/validation.dart';
import 'package:authentication/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/colorsHelper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailCon;
  @override
  void initState() {
    emailCon = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    emailCon.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.black3e,
      body: Form(
        key:  formKey,
        child: BlocConsumer<UserBloc, UserState>(
  listener: (context, state) {
    if(state is UserError){
      Utils().toastMessage(state.error.toString());
    }
    if(state is UserLogOut){
      context.go("/signin");
    }
  },
  builder: (context, state) {
    return Column(
          children: [
            CustomSignupDesign(
              height: AHelperFunction.screenSize(context).height * .37,
              callback: () {
                Utils().toastMessage("Check Your Email And Re - Enter Your Password");
                context.go("/signin");
              },
              title: StringHelper.fPTitle,
              sTitle: StringHelper.fPSTitle,
            ),
            SizedBox(height: DimensionHelper.dimens_60.h,),
            CustomTextfield(
              controller: emailCon,
              hintText: StringHelper.hEmail,
              validatore: (value) {
                return AValidator.validateEmail(value);
              },
              inputType: TextInputType.emailAddress,
              preIcon: Icons.mail,
            ),
            SizedBox(height: DimensionHelper.dimens_30.h,),
            state is UserLoading?CircularProgressIndicator(color: Colors.green,):CustomButton(
              margin: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_30.sp),
              text: StringHelper.submit,
              height: DimensionHelper.dimens_45,
              width: DimensionHelper.dimens_all,
              color: Colors.white,
              callback: () {
                if(formKey.currentState!.validate()){
                  context.read<UserBloc>().add(UserForgotPasswordEvent(email: emailCon.text.trim()));
                }
              },
            )
          ],
        );
  },
),
      ),
    );
  }
}

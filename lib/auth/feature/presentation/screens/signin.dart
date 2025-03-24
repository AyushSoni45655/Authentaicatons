import 'package:authentication/auth/feature/presentation/blocs/toggle_password/toggle_bloc.dart';
import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_signup_design.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_text_fiels.dart';
import 'package:authentication/core/constant/colorsHelper.dart';
import 'package:authentication/core/constant/dimensionHelper.dart';
import 'package:authentication/core/constant/stringHelper.dart';
import 'package:authentication/core/constant/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constant/fontsHelper.dart';
import '../../../../core/constant/helper_funcction.dart';
import '../../../../core/utils/utility.dart';
import '../blocs/checkbox/check_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailCon;
  late TextEditingController passCon;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailCon = TextEditingController();
    passCon = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCon.clear();
    passCon.clear();
    super.dispose();
  }

  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.black3e,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserError) {
                Utils().toastMessage(state.error.toString());
              }
              if (state is UserSuccess) {
                Utils().toastMessage("Login Successfully Completed");
                context.go("/home");
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomSignupDesign(
                    height: AHelperFunction.screenSize(context).height * .3,
                    title: StringHelper.wb,
                    sTitle: StringHelper.cYA,
                    callback: () {
                      context.go("/");
                    },
                  ),
                  SizedBox(
                    height: AHelperFunction.screenSize(context).height * .15,
                  ),
                  CustomTextfield(
                    controller: emailCon,
                    validatore: (value) {
                      return AValidator.validateEmail(value);
                    },
                    preIcon: Icons.mail,
                    hintText: StringHelper.hEmail,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: DimensionHelper.dimens_30.h),
                  BlocBuilder<ToggleBloc, TogglePassowrdState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        controller: passCon,
                        validatore: (value) {
                          return AValidator.validatePassword(value);
                        },
                        preIcon: Iconsax.check,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ToggleBloc>().add(
                              TooglePassworrdEvent(),
                            );
                          },
                          icon: Icon(
                            state.isToggle ? Iconsax.eye_slash : Iconsax.eye,
                          ),
                        ),
                        hintText: StringHelper.hPass,
                        inputType: TextInputType.number,
                        hide: state.isToggle,
                      );
                    },
                  ),
                  SizedBox(height: DimensionHelper.dimens_10.h),
                  BlocBuilder<CheckBloc, CheckBoxState>(
                    builder: (context, state) {
                      istrue = state.curruntValue;
                      return Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: DimensionHelper.dimens_20.w),
                              Checkbox(
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                value: state.curruntValue,
                                onChanged: (value) {
                                  context.read<CheckBloc>().add(
                                    CheckBoxEvent(value: value!),
                                  );
                                },
                              ),
                              SizedBox(width: DimensionHelper.dimens_10.w),
                              CustomText(
                                fontsize: FontHelper.font_16,
                                color: Colors.white,
                                text: StringHelper.remember,
                              ),
                            ],
                          ),
                          SizedBox(height: DimensionHelper.dimens_10.h),
                          state is UserLoading
                              ? CircularProgressIndicator(color: Colors.green)
                              : CustomButton(
                                cText: istrue,
                                callback: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<UserBloc>().add(
                                      UserSignInEvent(
                                        password: passCon.text,
                                        email: emailCon.text.trim(),
                                      ),
                                    );
                                  }
                                },
                                margin: EdgeInsets.symmetric(
                                  horizontal: DimensionHelper.dimens_20,
                                ),
                                color: Colors.white,
                                height: DimensionHelper.dimens_45,
                                text: StringHelper.signin,
                              ),
                          SizedBox(height: DimensionHelper.dimens_10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.go("/fPassword");
                                },
                                child: Text(
                                  StringHelper.fP,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontHelper.font_16.sp,
                                    fontWeight: FontHelper.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: DimensionHelper.dimens_20.w),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

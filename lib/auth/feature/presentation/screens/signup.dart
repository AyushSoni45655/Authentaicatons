import 'package:authentication/auth/feature/domain/entity/user.dart';
import 'package:authentication/auth/feature/presentation/blocs/checkbox/check_bloc.dart';
import 'package:authentication/auth/feature/presentation/blocs/toggle_password/toggle_bloc.dart';
import 'package:authentication/auth/feature/presentation/blocs/user/user_bloc.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_button.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_signup_design.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_text.dart';
import 'package:authentication/auth/feature/presentation/widgets/custom_text_fiels.dart';
import 'package:authentication/core/constant/colorsHelper.dart';
import 'package:authentication/core/constant/dimensionHelper.dart';
import 'package:authentication/core/constant/fontsHelper.dart';
import 'package:authentication/core/constant/stringHelper.dart';
import 'package:authentication/core/constant/validation.dart';
import 'package:authentication/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameCon;
  late TextEditingController emailCon;
  late TextEditingController passCon;
  late TextEditingController cPassCon;
  late TextEditingController phoneCon;

  @override
  void initState() {
    nameCon = TextEditingController();
    emailCon = TextEditingController();
    passCon = TextEditingController();
    cPassCon = TextEditingController();
    phoneCon = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameCon.clear();
    emailCon.clear();
    phoneCon.clear();
    passCon.clear();
    cPassCon.clear();
    super.dispose();
  }

  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    print(istrue);
    return Scaffold(
      backgroundColor: ColorsHelper.black3e,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if(state is UserError){
                Utils().toastMessage(state.error.toString());
              }
              if(state is UserSuccess){
                Utils().toastMessage("Account Created Successfully");
                context.go("/home");
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomSignupDesign(
                    callback: () {
                      context.go("/");
                    },
                    title: StringHelper.let,
                    sTitle: StringHelper.cNA,
                  ),
                  SizedBox(height: DimensionHelper.dimens_40.h),
                  CustomTextfield(
                    controller: nameCon,
                    validatore: (value) {
                      return AValidator.validateEmptyText("Name", value);
                    },
                    hintText: StringHelper.hName,
                    inputType: TextInputType.name,
                    preIcon: Icons.person,
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h),
                  CustomTextfield(
                    controller: emailCon,
                    validatore: (value) {
                      return AValidator.validateEmail(value);
                    },
                    hintText: StringHelper.hEmail,
                    inputType: TextInputType.emailAddress,
                    preIcon: Icons.mail,
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h),
                  CustomTextfield(
                    controller: phoneCon,
                    validatore: (value) {
                      return AValidator.validatePhoneNumber(value);
                    },
                    hintText: StringHelper.hPhone,
                    inputType: TextInputType.number,
                    preIcon: Icons.phone_android_outlined,
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h),
                  BlocBuilder<ToggleBloc, TogglePassowrdState>(
                    builder: (context, state) {
                      return CustomTextfield(
                        controller: passCon,
                        validatore: (value) {
                          return AValidator.validatePassword(value);
                        },
                        hintText: StringHelper.hPass,
                        inputType: TextInputType.number,
                        hide: state.isToggle,
                        preIcon: Iconsax.check,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ToggleBloc>().add(
                                TooglePassworrdEvent());
                          },
                          icon: Icon(
                            state.isToggle ? Iconsax.eye_slash : Iconsax.eye,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h),
                  CustomTextfield(
                    controller: cPassCon,
                    validatore: (value) {
                      return AValidator.validateConfirmPassword(
                        value,
                        passCon.text,
                      );
                    },
                    hintText: StringHelper.hCPass,
                    inputType: TextInputType.number,
                    hide: true,
                    preIcon: Iconsax.password_check,
                  ),
                  SizedBox(height: DimensionHelper.dimens_20.h),
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
                                text: StringHelper.aTTAC,
                              ),
                            ],
                          ),
                          SizedBox(height: DimensionHelper.dimens_10.h),
                          state is UserLoading?CircularProgressIndicator():CustomButton(
                            cText: istrue,
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                final user = UserEntity(
                                    id: "",
                                    name: nameCon.text,
                                    email: emailCon.text.trim(),
                                    password: passCon.text,
                                    phoneNumber: phoneCon.text
                                );
                                context.read<UserBloc>().add(UserSignUpEvent(userEntity: user));
                              }
                            },
                            margin: EdgeInsets.symmetric(
                              horizontal: DimensionHelper.dimens_20,
                            ),
                            color: Colors.white,
                            height: DimensionHelper.dimens_45,
                            text: StringHelper.signup,
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: DimensionHelper.dimens_14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: DimensionHelper.dimens_4.w),
                      CustomText(
                        text: StringHelper.aHAA,
                        fontsize: FontHelper.font_14,
                        color: Colors.white,
                      ),

                      CustomText(
                        callback: () {
                          context.go("/signin");
                        },
                        text: StringHelper.signin,
                        fontsize: FontHelper.font_14,
                        color: Colors.white,
                      ),
                      SizedBox(width: DimensionHelper.dimens_4.w),
                    ],
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
